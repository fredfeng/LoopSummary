#!/usr/bin/env python
from typing import List, Any
from tyrell.dsl import Node

from sys import argv
import tyrell.spec as S
from tyrell.interpreter import PostOrderInterpreter
from tyrell.enumerator.full_dsl_dependency_enumerator import DependencyEnumerator
from tyrell.enumerator import HoudiniEnumerator
from tyrell.decider import Example, BoundedModelCheckerDecider
from tyrell.synthesizer import Synthesizer
from tyrell.logger import get_logger
from slither.slither import Slither
from bmc import check_eq

import sys
sys.path.append("../analysis")

from analyze import analyze, analyze_lambdas, get_requires_conditions
from itertools import combinations, product 
import re
from collections import defaultdict
import argparse

logger = get_logger('tyrell')

def add_var(arg_map, var):
    type_name = str(var.type)
    if type_name in arg_map:
        if not var.name in arg_map[type_name]:
            arg_map[type_name].append(var.name)
    else:
        l = []
        l.append(var.name)
        arg_map[type_name] = l

def fetch_iterators(sol_file):
    with open(sol_file, "r") as f:
        ind = "//#LOOPVARS: "
        body = f.read()
        iterator_vars = []
        if ind in body:
            # Parse syntax arround global variables
            iterator_vars = body[body.index(ind)+12:].split("\n")[0]
            iterator_vars = iterator_vars.replace('[', "").replace(']', "").replace("'", "").replace(" ", "").split(", ")
            # remove empty elements (occurs if no loop vars given
            iterator_vars = list(filter(lambda x: x != '', iterator_vars))
        if iterator_vars == []:
            # If analysis reported no loop variables, assume iterator is "i" and global
            iterator_vars = ["i"]

    return iterator_vars

def build_glob_decl(vars_map, iterator_var, i_global):
    glob_decl = ""
    for k,vs in vars_map.items():
        glob_decl += "".join(map(lambda v: "" if (v == iterator_var and not i_global)
                                 else k + ' ' + v + '; \n', vs)) 

    return glob_decl

def build_type_table(vars_map, all_types, map_types, other_contracts):
    type_table = defaultdict(list)
    
    # Iterate through all global variables
    for typ in vars_map:
        # Add quotes to each variable of type "typ"
        q_vars = map(lambda v: '"' + v + '"', vars_map[typ]) 
        q_vars_list = ",".join(list(q_vars))

        # If type is an array, add its length to integers, and then
        #   convert the type to the appropriate mapping
        if "[]" in typ:
            len_vars = list(map(lambda v: '"{0}.length"'.format(v), vars_map[typ]))
            type_table["uint"] += len_vars
            typ = "mapping(uint => {0})".format(typ.replace("[]", ""))

        # Replace different bit amount variables with base version
        type_replacements = {"uint": ["uint8", "uint128", "uint256"],
                             "bytes": ["bytes32"]}
        for repl,orig_typs in type_replacements.items():
            for o_typ in orig_typs:
                typ = typ.replace(o_typ, repl)

        # Only add known types to type table
        if typ in all_types:
            # Convert map types syntax for DSL language
            if typ in map_types:
                matches = re.findall(r"(mapping\((.*) => (.*)\))", typ)
                if matches != []:
                    dom = matches[0][1]
                    codom = matches[0][2]
                    typ = "mapping_{0}_{1}".format(dom, codom)

            # add values of type "k" to the table
            type_table[typ] += q_vars_list.split(",")

            # add in other contract types to "Contract" for transfer
            #   TODO: I should probably restrict this to things called ERC20
            if typ in other_contracts:
                type_table["Contract"] += q_vars_list.split(",")
        else:
            print("IGNORED TYPE: {0}!".format(typ))

    return type_table

def fetch_int_constants(constants):
    extracted_ints = []
    for const in constants:
        try:
            int_const = '"{0}"'.format(int(const))
            extracted_ints.append(int_const)
        except:
            print("Ignoring {0} which is not int".format(const))

    return extracted_ints

def create_refinement_types(analysis, type_table, base_types):
    ref_types = ["Index", "Guard", "Read", "Write", "Constant", "GuardStart", "GuardEnd"]
    refinement_type_dict = {
        1: "Index",
        2: "Guard",
        3: "Read",
        4: "Write",
        5: "Constant",
        6: "GuardStart",
        7: "GuardEnd"
    }
    
    # Compute and store all combinations of refinements    
    comb_typs = []
    for i in range(0,len(ref_types)+1):
        comb_typs += combinations(ref_types, i)

    # extract ahead of time so in-time replacement in type_table doesn't break things
    type_table_contents = [(typ, list(vs)) for typ,vs in type_table.items()]
        
    # Iterate through dictionary of types --> var for base types (int, arr, etc.)
    for typ, vs in type_table_contents:
        for comb_typ in comb_typs:
            if comb_typ:
                final_typ = "{0}__{1}".format("_".join(comb_typ), typ)
            else:
                # No "__" if no refinement
                final_typ = typ
            if not final_typ in type_table:
                type_table[final_typ] = []        
            # Iterate through each variable
            for var in vs:
                quoted_var = var
                # Remove quotes
                var = var.replace('"', '')
                # Fetch var's refinements
                analysis_typs = []
                for ref_typ, ids in analysis.items():
                    if var in ids:
                        analysis_typs += [refinement_type_dict[ref_typ]]
                # Order refinements according to ref_typs
                analysis_typs = list(filter(lambda x: x in analysis_typs, ref_types))
                if all(map(lambda x: x in analysis_typs, list(comb_typ))):
                    type_table[final_typ].append(quoted_var)

    final_type_dict = {}
    # Remove empty entries from type table
    for typ, vs in type_table.items():
        if vs != []:
            # Remove duplicate entries if any
            final_type_dict[typ] = list(set(type_table[typ]))
        
    return final_type_dict

def instantiate_dsl(sol_file, analysis, lambdas, req_conds, prune):
    # Init slither
    slither = Slither(sol_file)

    # Get the contract, all the contact's name is C by default.
    contract = slither.get_contract_from_name('C')
    other_contracts = list(filter(lambda x: x != 'C', map(str, slither.contracts)))
    harness_fun = contract.functions[0]
    vars_map = {}

    # Get the function, which has name 'foo' by default.
    assert harness_fun.name == 'foo'

    # Add all read and written variables to the variable map
    for var in harness_fun.state_variables_read:
        add_var(vars_map, var)

    for var in harness_fun.state_variables_written:
        add_var(vars_map, var)

    actual_spec = dsl_skeleton
    
    int_str = ""
    address_str = ""
    maparray_str = ""
    mapint_str = ""

    # Fetch the variable used as the loop iterator
    # TODO: Handle multiple iterators (i.e. multiple loops)?    
    iterator_var = fetch_iterators(sol_file)[0]
    
    # Check if "i", the iterator we use to translate dsl, is a global variable
    i_global = iterator_var in list(map(str, contract.variables))    

    # Build global variable declarations for produced dsl solidity code
    glob_decl = build_glob_decl(vars_map, iterator_var, i_global)

    # List of basic solidity types, plus any user defined types (other_contracts)
    base_types = ["uint", "bool", "address", "bytes"] + other_contracts

    # Construct all possible (non-nested) map types using the base types
    map_types = list(map(lambda x: "mapping({0} => {1})".format(x[0], x[1]), product(base_types, repeat=2)))

    # List all types, including the special "g_int", which is used for global integers
    all_types = base_types + map_types + ["g_int"]

    # Maps types to global variables of that type
    type_table = build_type_table(vars_map, all_types, map_types, other_contracts)

    # Copy global integers into special separate type "g_int"
    type_table["g_int"] = list(set(type_table["uint"]))

    # Fetch integer constant values
    C = fetch_int_constants(analysis[5]) if prune else []        
    # Add 0 and 1 and remove duplicates
    C = list(set(C+['"0"', '"1"']))
    # Non-zero constants
    nonzero_C = list(filter(lambda x: x != '"0"', C))
    # Boolean constants
    B = ['"true"', '"false"']
    
    # Add int constants separately for DSL where only constants are needed
    type_table["C"] = C
    # Non-zero values for div and mul
    type_table["nonzero_uint"] = list(set(type_table["uint"]+nonzero_C))
    # Add int constants to ints
    type_table["uint"] = list(set(type_table["uint"]+C))
    # Add "true" and "false" as boolean constants
    type_table["bool"] = list(set(type_table["bool"]+B))
    # Add 0 address to addresses
    type_table["address"] = list(set(type_table["address"]+['"address(0)"']))

    # Add in lambdas if present
    if (lambdas):
        type_table["Lambda"] = list(map(lambda x: '"{0}"'.format(x), lambdas))

    # Add requires conditions if present
    if (req_conds):
        type_table["ReqCond"] = list(map(lambda x: '"{0}"'.format(x), req_conds))
        
    if prune:
        # Create and add in refinement types from analysis        
        type_table = create_refinement_types(analysis, type_table, base_types)
    else:
        # Remove refinement types from dsl
        actual_spec = remove_refinement(actual_spec)
        # Add in arithmetic lambda funcs
        actual_spec += '''
func add: L -> uint;
func mul: L -> nonzero_uint;
func sub: L -> uint;
func div: L -> nonzero_uint;
        '''
        # Use filter conditional for require as well as filter
        actual_spec = actual_spec.replace("ReqCond", "Cond")        
    # Build DSL enums from type table
    typ_enums = ""
    for typ, vals in type_table.items():
        typ_enums +="""
        enum {0} {{
            {1}
        }}
        """.format(typ, ",".join(vals))        
        
    # Uses the type_table to expand wild cards from DSL
    actual_spec = expand_dsl(actual_spec, type_table, base_types, all_types)    

    # Fills in typ_enums
    actual_spec = actual_spec.format(types=typ_enums)
    
    return actual_spec, glob_decl, type_table, i_global, [iterator_var]

def get_base_type(typ):
    if not "__" in typ:
        return typ

    return typ.split("__")[1]

def remove_refinement(dsl):
    new_dsl = []
    for line in dsl.split("\n"):
        if line.startswith("func"):
            # extract arg types
            args = line.split("->")[1][:-1].split(",")            
            for arg in args:
                # replace map types first
                matches = re.findall(r"(mapping\((.*) => (.*)\))", arg)                
                if matches:
                    dom = matches[0][1]
                    codom = matches[0][2]
                    new_dom = get_base_type(dom)
                    new_codom = get_base_type(codom)
                    new_arg = "mapping({0} => {1})".format(new_dom, new_codom)
                    line = line.replace(matches[0][0], new_arg)

                # replace parent type
                line = line.replace(arg, get_base_type(arg))

            # Write adjusted func line
            new_dsl.append(line)
        else:
            # Write all non-func lines
            new_dsl.append(line)
            
    return "\n".join(new_dsl)

def convert_map_types(types):
    new_types = set()
    for typ in types:
        matches = re.findall(r"(mapping\((.*) => (.*)\))", typ)
        if matches != []:
            full_dec = matches[0][0]
            dom = matches[0][1]
            codom = matches[0][2]
            new_type = "mapping_{0}_{1}".format(dom, codom)
            new_types.add(new_type)
        else:
            new_types.add(typ)

    return list(new_types)

def replace_map_types_and_fetch_map_wildcards(line):
    map_wildcards = set()
    args = line.replace(";","").split("->")[1].split(",")
    for arg in args:
        matches = re.findall(r"(mapping\((.*) => (.*)\))", arg)
        if matches != []:
            full_dec = matches[0][0]
            dom = matches[0][1]
            codom = matches[0][2]
            new_type = "mapping_{0}_{1}".format(dom, codom)
            line = line.replace(full_dec, new_type)
            if dom.startswith("#"): map_wildcards.add(dom)
            if codom.startswith("#"): map_wildcards.add(codom)

    return line, map_wildcards

def find_non_map_wildcards(line, map_wildcards):
    matches = re.findall(r"(__(.*):)", line)
    wildcards = set()
    if matches != []:
        wildcards = set(matches[0][1].split("_"))
        wildcards -= map_wildcards

    return wildcards

def expand_wildcards(wildcards, types, lines):
    new_lines = []
    if len(wildcards) > 0:
        poss_types = product(types, repeat=len(wildcards))
        for types in poss_types:
            for new_line in lines:
                for wildcard,typ in zip(wildcards, list(types)):
                    new_line = new_line.replace(wildcard, typ)
                new_lines.append(new_line)
    else:
        for new_line in lines:
            new_lines.append(new_line)

    return new_lines
                
def remove_impossible_types(dsl, type_table, final_funcs):    
    added_type = False
    for line in dsl:
        line_split = line.replace(";","").replace(" ", "").split("->")
        args = line_split[1].split(",")
        ret_type = line_split[0].split(":")[1].replace(" ", "")

        # if all types are in the type table and the line has not already been added
        if (all(map(lambda a: a in type_table and (len(type_table[a]) > 0), args)) and
            (not line in final_funcs)):
            final_funcs.append(line)
            if not ret_type in type_table: type_table[ret_type] = ["42"]
            added_type = True
    
    if added_type:
        return remove_impossible_types(dsl, type_table, final_funcs)

    return final_funcs
    
def expand_dsl(dsl, type_table, base_types, all_types):
    all_types = convert_map_types(all_types)
    function_lines = []
    other_lines = []
    for line in dsl.split("\n"):
        if line.startswith("func"):
            # Fetch wildcards which appear in map, and replace map syntax
            line, map_wildcards = replace_map_types_and_fetch_map_wildcards(line)

            # Fetch wildcards which do not appear in map
            wildcards = find_non_map_wildcards(line, map_wildcards)
            
            # Duplicate line for all possible wildcard values, which include map types
            wildcard_lines = expand_wildcards(wildcards, all_types, [line])
            
            # Duplicate all wildcard lines by expanding map wildcards, which cannot be map
            #    types due to restriction on no nested mappings
            map_wildcard_lines = expand_wildcards(map_wildcards, base_types, wildcard_lines)

            # Write all duplicated lines
            for new_line in map_wildcard_lines:
                function_lines.append(new_line)
        else:
            # Write all non-func lines
            other_lines.append(line)

    # Remove types which could never be created (due to the types of globals)
    function_lines = remove_impossible_types(function_lines, type_table, [])

    return "\n".join(other_lines + function_lines)

dsl_skeleton ='''
{types}

value L;
value IF;
value i;
value i_st;
value i_end;
value F;
value Cond_uint;
value Cond_address;
value Summary;
value Inv;

program SolidityLoops() -> Summary;

func summarize: Summary -> Inv, i_st, i_end;
func summarize_nost: Summary -> Inv, i_end;

func seqF: Inv -> F, Inv;
func seqIF: Inv -> IF, Inv;

func intFunc: Inv -> IF;
func nonintFunc: Inv -> F;

# DSL Functions (with lambda versions when appropriate)
# func SUM_L: IF -> Write__g_int, Read__mapping(uint => uint), L;
# func SUM: IF -> Write__g_int, Read__mapping(uint => uint);
# func NESTED_SUM_L: IF -> Write__g_int, Read__mapping(address => uint), L, Index_Read__mapping(uint => address);
# func NESTED_SUM: IF -> Write__g_int, Read__mapping(address => uint), Index_Read__mapping(uint => address);
# func COPYRANGE_L: IF -> Read__mapping(uint => uint), i, Write__mapping(uint => uint), L;
# func COPYRANGE__#A: IF -> Read__mapping(uint => #A), i, Write__mapping(uint => #A);
# func NESTED_COPYRANGE__#A: IF -> Read__mapping(uint => #A), i, Write__mapping(address => #A), Index_Read__mapping(uint => address);
# func NESTED_COPYRANGE_L: IF -> Read__mapping(uint => uint), i, Write__mapping(address => uint), L, Index_Read__mapping(uint => address);
# func MAP_L: IF -> Read_Write__mapping(uint => uint), L;
# func MAP__#A: F -> Write__mapping(uint => #A), Read__#A;
# func INCRANGE_L: IF -> Read__mapping(uint => uint), i, Write__mapping(uint => uint), L;
# func INCRANGE: IF -> Read__mapping(uint => uint), i, Write__mapping(uint => uint);
# func NESTED_INCRANGE_L: IF -> Read__mapping(uint => uint), i, Write__mapping(address => uint), L, Index_Read__mapping(uint => address);
# func NESTED_INCRANGE: IF -> Read__mapping(uint => uint), i, Write__mapping(address => uint), Index_Read__mapping(uint => address);
# func FILTER__uint: F -> Write__mapping(uint => uint), IF, Cond_uint;
# func FILTER__address: F -> Write__mapping(uint => address), IF, Cond_address;
# func REQUIRE_ASCENDING: F -> mapping(uint => uint);
# func REQUIRE_DESCENDING: F -> mapping(uint => uint);
# func REQUIRE__uint: F -> Cond_uint;
# func TRANSFER: F -> mapping(uint => address), mapping(uint => uint);
# func TRANSFER_L: F -> mapping(uint => address), mapping(uint => uint), L;
# func REQUIRE_TRANSFER: F -> mapping(uint => address), mapping(uint => uint);
# func REQUIRE_TRANSFER_L: F -> mapping(uint => address), mapping(uint => uint), L;
# func UPDATERANGE__#A_#B: F -> Index_Read__mapping(uint => #A), Write__mapping(#A => #B), Read__#B;

# Arithmetic funcs for lambda
func lambda: L -> Lambda;

# Add constant for global integers
func addc: i -> g_int, C;
func subc: i -> g_int, C;
func const: i -> C;
func addc_st: i_st -> GuardStart__uint, C;
func addc_end: i_end -> GuardEnd__uint, C;
func subc_st: i_st -> GuardStart__uint, C;
func subc_end: i_end -> GuardEnd__uint, C;

# Boolean comps for uint
func lt: Cond_uint -> mapping(uint => uint), uint;
func gt: Cond_uint -> mapping(uint => uint), uint;
func eq: Cond_uint -> mapping(uint => uint), uint;
func neq: Cond_uint -> mapping(uint => uint), uint;
func lte: Cond_uint -> mapping(uint => uint), uint;
func gte: Cond_uint -> mapping(uint => uint), uint;
func bool_arrT: Cond_uint -> mapping(uint => bool);
func bool_arrF: Cond_uint -> mapping(uint => bool);

# Boolean compus for uint w/ nested array access
func lt2: Cond_uint -> mapping(uint => address), mapping(address => uint), uint;
func gt2: Cond_uint -> mapping(uint => address), mapping(address => uint), uint;
func eq2: Cond_uint -> mapping(uint => address), mapping(address => uint), uint;
func neq2: Cond_uint -> mapping(uint => address), mapping(address => uint), uint;
func lte2: Cond_uint -> mapping(uint => address), mapping(address => uint), uint;
func gte2: Cond_uint -> mapping(uint => address), mapping(address => uint), uint;
func bool_arrT2: Cond_uint -> mapping(uint => address), mapping(address => bool);
func bool_arrF2: Cond_uint -> mapping(uint => address), mapping(address => bool);

# Boolean comps for address
func eq_addr: Cond_address -> mapping(uint => address), address;
func neq_addr: Cond_address -> mapping(uint => address), address;
'''

class SymDiffInterpreter(PostOrderInterpreter):

    program_decl = ""

    contract_prog = """pragma solidity ^0.5.10;

        contract C {{
            
            {structs}

            {_decl}

            {other_decs}

            function foo() public {{

                {_body}

            }}

            {other_funcs}
        }}

        {other_contracts}

    """

    extra_contract = """
    contract {0} {{{{ }}}}
    """

    # pc counter, self.pc
    pc = 0

    def __init__(self, decl="", contracts=[], i_global=False, global_vars=["i"], structs=""):
        # for contract in contracts:
        #     self.contract_prog += self.extra_contract.format(contract)
        self.other_contracts = contracts
        self.program_decl = decl
        self.i_typ = "" if i_global else "uint"
        # TODO: HANDLE NESTED LOOPS
        self.iterator = global_vars[0]
        self.structs = structs
        self.other_funcs = set()
        self.other_decs = set()

        self._ref_counter = -1 # reference variable counter
        self._tmp_counter = -1 # temporary variable counter
        self._ckpt_counter = -1 # checkpoint variable counter (for require method)

    def get_fresh_ref_name(self):
        self._ref_counter += 1
        return "REF_{}".format(self._ref_counter)

    def get_fresh_tmp_name(self):
        # (notice) fresh tmp name is only for those instructions that
        # 1) do not need the return values (e.g., array-write)
        # 2) do not care about the target value (e.g., int i; in for where i has no initial value)
        # otherwise, please use other get_fresh methods
        self._tmp_counter += 1
        return "TMP_{}".format(self._tmp_counter)

    def get_fresh_ckpt_name(self):
        # (notice) fresh checkpoint name for `require` method
        # in bmc, this variable is added to the verification pool
        # and two programs should use DIFFERENT symbolic variables to store checkpoints
        # (important) _ckpt_counter is local to every eval
        # so it should be reset to -1 before every eval
        self._ckpt_counter += 1
        return "CKPT_{}".format(self._ckpt_counter)

    # overridding the eval method by adding one extra call to reset _ckpt_counter
    def eval(self, prog: Node, inputs: List[Any]) -> Any:
        self._ckpt_counter = -1 # reset _ckpt_counter
        return super(SymDiffInterpreter, self).eval(prog, inputs)

    #########################################
    # Conditional Operators
    #########################################

    def get_nested_access(self, args):
        return "{0}[{1}[{2}]]".format(args[1], args[0], self.iterator)

    def eval_lt2(self, node, args):
        arr = self.get_nested_access(args)
        raise NotImplementedError( arr + "<" + args[2] )

    def eval_lte2(self, node, args):
        arr = self.get_nested_access(args)
        raise NotImplementedError( arr + "<=" + args[2] )

    def eval_eq2(self, node, args):
        arr = self.get_nested_access(args)        
        raise NotImplementedError( arr + "==" + args[2] )
     
    def eval_neq2(self, node, args):
        arr = self.get_nested_access(args)                
        raise NotImplementedError( arr + "!=" + args[2] )
    
    def eval_gt2(self, node, args):
        arr = self.get_nested_access(args)                
        raise NotImplementedError( arr + ">" + args[2] )
    
    def eval_gte2(self, node, args):
        arr = self.get_nested_access(args)                
        raise NotImplementedError( arr + ">=" + args[2] )

    def eval_bool_arrT2(self, node, args):
        arr = self.get_nested_access(args)                
        raise NotImplementedError( arr )
    
    def eval_bool_arrF2(self, node, args):
        arr = self.get_nested_access(args)                
        raise NotImplementedError( "!" + arr )

    ###
        
    def eval_lt(self, node, args):
        # special wrapper lt wrapper
        return "ARRAY-LT {} {} {}".format(args[0], self.iterator, args[1])
        # arr = "{0}[{1}]".format(args[0], self.iterator)
        # return arr + "<" + args[1]

    def eval_lte(self, node, args):
        # special array lte wrapper
        return "ARRAY-LTE {} {} {}".format(args[0], self.iterator, args[1])
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + "<=" + args[1]

    def eval_eq(self, node, args):
        # special array eq wrapper
        return "ARRAY-EQ {} {} {}".format(args[0], self.iterator, args[1])
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + "==" + args[1]
    
    def eval_neq(self, node, args):
        # special array neq wrapper
        return "ARRAY-NEQ {} {} {}".format(args[0], self.iterator, args[1])
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + "!=" + args[1]
    
    def eval_gt(self, node, args):
        # special array gt wrapper
        return "ARRAY-GT {} {} {}".format(args[0], self.iterator, args[1])
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + ">" + args[1]
    
    def eval_gte(self, node, args):
        # special array gte wrapper
        return "ARRAY-GTE {} {} {}".format(args[0], self.iterator, args[1])
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + ">=" + args[1]

    def eval_bool_arrT(self, node, args):
        arr = "{0}[{1}]".format(args[0], self.iterator)        
        raise NotImplementedError( arr )
    
    def eval_bool_arrF(self, node, args):
        arr = "{0}[{1}]".format(args[0], self.iterator)        
        raise NotImplementedError( "!" + arr )

    def eval_eq_addr(self, node, args):
        # special array eq wrapper
        # for address, strip off the address call wrapper
        return "ARRAY-EQ {} {} {}".format(args[0], self.iterator, args[1].replace("address(","").replace(")",""))
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + "==" + args[1]

    def eval_neq_addr(self, node, args):
        # special array neq wrapper
        # for address, strip off the address call wrapper
        return "ARRAY-NEQ {} {} {}".format(args[0], self.iterator, args[1].replace("address(","").replace(")",""))
        # arr = "{0}[{1}]".format(args[0], self.iterator)        
        # return arr + "!=" + args[1]
    
    def eval_and(self, node, args):
        return "AND {} {}".format(args[0], args[1])
        # return args[0] + " && " + args[1]
    
    def eval_or(self, node, args):
        return "OR {} {}".format(args[0], args[1])
        # return args[0] + " || " + args[1]

    def eval_const(self, node, args):
        return args[0]
    
    def eval_addc(self, node, args):
        return "ADD {} {}".format(args[0], args[1])
        # return args[0] + '+' + args[1]

    def eval_addc_st(self, node, args):
        return "ADD {} {}".format(args[0], args[1])
        # return args[0] + '+' + args[1]

    def eval_addc_end(self, node, args):
        return "ADD {} {}".format(args[0], args[1])
        # return args[0] + '+' + args[1]

    def eval_subc(self, node, args):
        return "SUB {} {}".format(args[0], args[1])
        # return args[0] + '-' + args[1]

    def eval_subc_st(self, node, args):
        return "SUB {} {}".format(args[0], args[1])
        # return args[0] + '-' + args[1]

    def eval_subc_end(self, node, args):
        return "SUB {} {}".format(args[0], args[1])
        # return args[0] + '-' + args[1]

    #########################################
    # Lambda operators
    #########################################

    # Ben says don't use this one
    # def eval_lambda(self, node, args):
    #     return args[0].split(":")[1].replace(" ", "")
        
    def eval_const(self, node, args):
        return args[0]

    def eval_add(self, node, args):
        # return "__x" + '+' + args[0]
        if args[0] == "-1":
            # return "__x-1"
            return "SUB {} {}".format("__x", "1")
        # return "__x" + '+' + args[0]
        return "ADD {} {}".format("__x", args[0])

    def eval_sub(self, node, args):
        # return "__x" + '-' + args[0]
        return "SUB {} {}".format("__x", args[0])

    def eval_mul(self, node, args):
        # return "__x" + '*' + args[0]
        return "MUL {} {}".format("__x", args[0])
    
    def eval_div(self, node, args):
        # return "__x" + '/' + args[0]
        return "DIV {} {}".format("__x", args[0])

    #########################################
    # DSL
    #########################################
    def build_sum(self, node, args, l, nested):
        # print("build_sum args: {}".format(args))
        # print("build_sum l: {}".format(l))
        # print("build_sum nested: {}".format(nested))
        tgtAcc = args[0]
        srcArr = args[1]
        Lam = args[2] if l else None
        if nested:
            indexArr = args[3] if l else args[2]
        else:
            indexArr = None
        it = self.iterator
        # build_sum is doing: 
        # 1 (nested+lambda). tgtAcc += Lam( srcArr[indexArr[it]] )
        # 2 (nested only).   tgtAcc += srcArr[indexArr[it]]
        # 3 (lambda only).   tgtAcc += Lam( srcArr[it] )
        # 4 ().              tgtAcc += srcArr[it]

        # FIXME: missing initialization expression outside the loop body
        inst_list = []

        # e.g., self.iterator = {{GuardStart}}
        inst = "{}: {} = {{GuardStart}}".format(hex(self.pc), it)
        inst_list.append(inst)
        self.pc += 1

        ref_0 = self.get_fresh_ref_name()
        if nested:
            # ref_0 = indexArr[it]
            inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_0, indexArr, it )
        else:
            # ref_0 = it
            inst = "{}: {} = {}".format( hex(self.pc), ref_0, it )
        inst_list.append(inst)
        self.pc += 1

        # ref_1 = srcArr[ref_0]
        ref_1 = self.get_fresh_ref_name()
        inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_1, srcArr, ref_0 )
        inst_list.append(inst)
        self.pc += 1

        ref_2 = self.get_fresh_ref_name()
        if l:
            # ref_2 = Lam(ref_1)
            inst = "{}: {} = {}".format( hex(self.pc), ref_2, Lam.replace("__x", ref_1) )
        else:
            # ref_2 = ref_1
            inst = "{}: {} = {}".format( hex(self.pc), ref_2, ref_1 )
        inst_list.append(inst)
        self.pc += 1

        # tgtAcc = tgtAcc + ref_2
        inst = "{}: {} = ADD {} {}".format( hex(self.pc), tgtAcc, tgtAcc, ref_2 )
        inst_list.append(inst)
        self.pc += 1

        return inst_list, [tgtAcc]

    def eval_SUM(self, node, args):
        return self.build_sum(node, args, False, False)

    def eval_SUM_L(self, node, args):
        return self.build_sum(node, args, True, False)
    
    def eval_NESTED_SUM(self, node, args):
        return self.build_sum(node, args, False, True)

    def eval_NESTED_SUM_L(self, node, args):
        return self.build_sum(node, args, True, True)

    def build_copyrange(self, node, args, l, nested):   
        # print("build_copyrange args: {}".format(args))
        # print("build_copyrange l: {}".format(l))
        # print("build_copyrange nested: {}".format(nested))  
        srcArr = args[0]
        srcStart = args[1]
        tgtArr = args[2]
        Lam = args[3] if l else None
        if nested:
            indexArr = args[4] if l else args[3]
        else:
            indexArr = None
        it = self.iterator
        # build_copyrange is doing: 
        # 1 (nested+lambda). tgtArr[indexArr[it]] = Lam( srcArr[it+srcStart] )
        # 2 (nested only).   tgtArr[indexArr[it]] = srcArr[it+srcStart]
        # 3 (lambda only).   tgtArr[it] = Lam( srcArr[it+srcStart] )
        # 4 ().              tgtArr[it] = srcArr[it+srcStart]

        inst_list = []

        # e.g., self.iterator = {{GuardStart}}
        inst = "{}: {} = {{GuardStart}}".format(hex(self.pc), it)
        inst_list.append(inst)
        self.pc += 1

        # ref_0 = it+srcStart
        ref_0 = self.get_fresh_ref_name()
        inst = "{}: {} = ADD {} {}".format( hex(self.pc), ref_0, it, srcStart )
        inst_list.append(inst)
        self.pc += 1

        # ref_1 = srcArr[ref_0]
        ref_1 = self.get_fresh_ref_name()
        inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_1, srcArr, ref_0 )
        inst_list.append(inst)
        self.pc += 1

        ref_2 = self.get_fresh_ref_name()
        if l:
            # ref_2 = Lam( ref_1 )
            inst = "{}: {} = {}".format( hex(self.pc), ref_2, Lam.replace("__x", ref_1) )
        else:
            # ref_2 = ref_1
            inst = "{}: {} = {}".format( hex(self.pc), ref_2, ref_1 )
        inst_list.append(inst)
        self.pc += 1

        ref_3 = self.get_fresh_ref_name()
        if nested:
            # ref_3 = indexArr[it]
            inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_3, indexArr, it )
        else:
            # ref_3 = it
            inst = "{}: {} = {}".format( hex(self.pc), ref_3, it )
        inst_list.append(inst)
        self.pc += 1

        # tgtArr[ref_3] = ref_2
        tmp_4 = self.get_fresh_tmp_name()
        inst = "{}: {} = ARRAY-WRITE {} {} {}".format( hex(self.pc), tmp_4, tgtArr, ref_3, ref_2 )
        inst_list.append(inst)
        self.pc += 1

        return inst_list, [tgtArr]
    
    def eval_COPYRANGE(self, node, args):
        return self.build_copyrange(node, args, False, False)

    def eval_COPYRANGE_L(self, node, args):
        return self.build_copyrange(node, args, True, False)

    def eval_NESTED_COPYRANGE(self, node, args):
        return self.build_copyrange(node, args, False, True)

    def eval_NESTED_COPYRANGE_L(self, node, args):
        return self.build_copyrange(node, args, True, True)

    def build_incrange(self, node, args, l, nested):        
        # print("build_incrange args: {}".format(args))
        # print("build_incrange l: {}".format(l))
        # print("build_incrange nested: {}".format(nested))  
        srcArr = args[0]
        srcStart = args[1]
        tgtArr = args[2]
        Lam = args[3] if l else None
        if nested:
            indexArr = args[4] if l else args[3]
        else:
            indexArr = None
        it = self.iterator
        # build_incrange is doing: 
        # 1 (nested+lambda). tgtArr[indexArr[it]] += Lam( srcArr[it+srcStart] )
        # 2 (nested only).   tgtArr[indexArr[it]] += srcArr[it+srcStart]
        # 3 (lambda only).   tgtArr[it] += Lam( srcArr[it+srcStart] )
        # 4 ().              tgtArr[it] += srcArr[it+srcStart]

        inst_list = []

        # e.g., self.iterator = {{GuardStart}}
        inst = "{}: {} = {{GuardStart}}".format(hex(self.pc), it)
        inst_list.append(inst)
        self.pc += 1

        # ref_0 = it+srcStart
        ref_0 = self.get_fresh_ref_name()
        inst = "{}: {} = ADD {} {}".format( hex(self.pc), ref_0, it, srcStart )
        inst_list.append(inst)
        self.pc += 1

        # ref_1 = srcArr[ref_0]
        ref_1 = self.get_fresh_ref_name()
        inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_1, srcArr, ref_0 )
        inst_list.append(inst)
        self.pc += 1

        ref_2 = self.get_fresh_ref_name()
        if l:
            # ref_2 = Lam( ref_1 )
            inst = "{}: {} = {}".format( hex(self.pc), ref_2, Lam.replace("__x", ref_1) )
        else:
            # ref_2 = ref_1
            inst = "{}: {} = {}".format( hex(self.pc), ref_2, ref_1 )
        inst_list.append(inst)
        self.pc += 1

        ref_3 = self.get_fresh_ref_name()
        if nested:
            # ref_3 = indexArr[it]
            inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_3, indexArr, it )
        else:
            # ref_3 = it
            inst = "{}: {} = {}".format( hex(self.pc), ref_3, it )
        inst_list.append(inst)
        self.pc += 1

        # ref_4 = tgtArr[ref_3]
        ref_4 = self.get_fresh_ref_name()
        inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_4, tgtArr, ref_3 )
        inst_list.append(inst)
        self.pc += 1

        # ref_5 = ref_4 + ref_2
        ref_5 = self.get_fresh_ref_name()
        inst = "{}: {} = ADD {} {}".format( hex(self.pc), ref_5, ref_4, ref_2 )
        inst_list.append(inst)
        self.pc += 1

        # tgtArr[ref_3] = ref_5
        tmp_6 = self.get_fresh_tmp_name()
        inst = "{}: {} = ARRAY-WRITE {} {} {}".format( hex(self.pc), tmp_6, tgtArr, ref_3, ref_5 )
        inst_list.append(inst)
        self.pc += 1

        return inst_list, [tgtArr]

    def eval_INCRANGE(self, node, args):
        return self.build_incrange(node, args, False, False)

    def eval_INCRANGE_L(self, node, args):
        return self.build_incrange(node, args, True, False)

    def eval_NESTED_INCRANGE(self, node, args):
        return self.build_incrange(node, args, False, True)

    def eval_NESTED_INCRANGE_L(self, node, args):
        return self.build_incrange(node, args, True, True)

    def build_map(self, node, args, l):     
        # print("build_map args: {}".format(args))
        # print("build_map l: {}".format(l)) 
        tgtArr = args[0]
        srcVal = args[1]
        Lam = args[2] if l else None
        it = self.iterator
        # build_map is doing: 
        # 1 (lambda). tgtArr[it] = Lam( srcVal )
        # 2 ().       tgtArr[it] = srcVal

        inst_list = []

        # e.g., self.iterator = {{GuardStart}}
        inst = "{}: {} = {{GuardStart}}".format(hex(self.pc), it)
        inst_list.append(inst)
        self.pc += 1

        ref_0 = self.get_fresh_ref_name()
        if l:
            # ref_0 = Lam( srcVal )
            inst = "{}: {} = {}".format( hex(self.pc), ref_0, Lam.replace("__x", srcVal) )
        else:
            # ref_0 = srcVal
            inst = "{}: {} = {}".format( hex(self.pc), ref_0, srcVal )
        inst_list.append(inst)
        self.pc += 1

        # tgtArr[it] = ref_0
        tmp_1 = self.get_fresh_tmp_name()
        inst = "{}: {} = ARRAY-WRITE {} {} {}".format( hex(self.pc), tmp_1, tgtArr, it, ref_0 )
        inst_list.append(inst)
        self.pc += 1

        return inst_list, [tgtArr]

    def eval_MAP(self, node, args):
        return self.build_map(node, args, False)

    def eval_MAP_L(self, node, args):
        return self.build_map(node, args, True)

    def build_updaterange(self, node, args):   
        # print("build_updaterange args: {}".format(args))
        # print("build_updaterange l: {}".format(l))     
        indexArr = args[0]
        tgtArr = args[1]
        srcVal = args[2]
        it = self.iterator
        # build_updaterange is doing: 
        # 1 (). tgtArr[it] = srcVal

        inst_list = []

        # e.g., self.iterator = {{GuardStart}}
        inst = "{}: {} = {{GuardStart}}".format(hex(self.pc), it)
        inst_list.append(inst)
        self.pc += 1

        # ref_0 = indexArr[it]
        ref_0 = self.get_fresh_ref_name()
        inst = "{}: {} = ARRAY-READ {} {}".format( hex(self.pc), ref_0, indexArr, it )
        inst_list.append(inst)
        self.pc += 1

        # tgtArr[ref_0] = srcVal
        tmp_1 = self.get_fresh_tmp_name()
        inst = "{}: {} = ARRAY-WRITE {} {} {}".format( hex(self.pc), tmp_1, tgtArr, ref_0, srcVal )
        inst_list.append(inst)
        self.pc += 1

        return inst_list, [tgtArr]
    
    def eval_UPDATERANGE(self, node, args):
        return self.build_updaterange(node, args)

    def eval_summarize(self, node, args):
        start = args[1]
        end = args[2]
        body = args[0] # (list_of_inst, list_of_var_to_verify)

        new_body = (
            [inst.format(GuardStart=start, GuardEnd=end) for inst in body[0]],
            body[1]
        )

        # FIXME: ignoring structs/other_contracts/other_funcs/other_decs
        return new_body

    def eval_summarize_nost(self, node, args):
        end = args[1]
        body = args[0] # (list_of_inst, list_of_var_to_verify)

        tmp_0 = self.get_fresh_tmp_name()
        new_body = (
            [inst.format(GuardStart=tmp_0, GuardEnd=end) for inst in body[0]],
            body[1]
        )

        # FIXME: ignoring structs/other_contracts/other_funcs/other_decs
        return new_body

    def eval_intFunc(self, node, args):
        return args[0]

    def eval_nonintFunc(self, node, args):
        return args[0]

    def build_seq(self, node, args):
        loop0, vlist0 = args[0]
        loop1, vlist1 = args[1]
        return loop0+loop1, list(set(vlist0+vlist1))

    def eval_seqF(self, node, args):
        return self.build_seq(node, args)

    def eval_seqIF(self, node, args):
        return self.build_seq(node, args)

    
def execute(interpreter, prog, args):
    return interpreter.eval(prog, args)


def test_all(interpreter, prog, inputs, outputs):
    return all(
        execute(interpreter, prog, inputs[x]) == outputs[x]
        for x in range(0, len(inputs))
    )

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", help="solidity file path from which to extract a loop", type=str)
    parser.add_argument("--prune", help="Activates analysis-based pruning", action="store_true")
    return parser.parse_args()

def extract_contracts(sol_file):
    contracts = ""
    afterLoopVars = False
    with open(sol_file, "r") as f:
        for line in f:
            if afterLoopVars:
                contracts += line
            if "LOOPVARS" in line:
                afterLoopVars = True

    return contracts

def extract_structs(sol_file):
    structs = ""
    with open(sol_file, "r") as f:
        for line in f:
            if "struct " in line:
                structs += line

    return structs

def main(args):    
    sol_file = args.file
    seed = None
    # assert False

    # Get all structs declared
    structs = extract_structs(sol_file)
    # Get all contracts declared
    other_contracts = extract_contracts(sol_file)
    
    if args.prune:
        logger.info('Analyzing Input...')
        deps, refs = analyze(sol_file, "C", "foo()")
        print(deps.dependencies)
        lambdas = analyze_lambdas(sol_file, "C", "foo()")
        req_conds = get_requires_conditions(sol_file)
        logger.info('Analysis Successful!')

    if args.prune:
        actual_spec, glob_decl, types, i_global, global_vars = instantiate_dsl(sol_file, refs.types, lambdas, req_conds, True)
    else:
        actual_spec, glob_decl, types, i_global, global_vars = instantiate_dsl(sol_file, None, None, None, False)
        
    print(actual_spec)
    # input("SEE THE SPEC ABOVE")
    
    logger.info('Parsing Spec...')
    spec = S.parse(actual_spec)
    logger.info('Parsing succeeded')

    # # Fetch other contract names
    # slither = Slither(sol_file)
    # other_contracts = list(filter(lambda x: x != 'C', map(str, slither.contracts)))
    
    logger.info('Building synthesizer...')
    synthesizer = Synthesizer(
        enumerator=DependencyEnumerator(
            spec, max_depth=6, seed=seed, analysis=deps.dependencies if args.prune else None, types=types),
        decider=BoundedModelCheckerDecider(
            interpreter=SymDiffInterpreter(glob_decl, other_contracts, i_global, global_vars, structs), example=sol_file, equal_output=check_eq)
    )
    logger.info('Synthesizing programs...')
    # input("PRESS TO START")

    prog = synthesizer.synthesize()
    if prog is not None:
        logger.info('Solution found: {}'.format(prog))
        return True
    else:
        logger.info('Solution not found!')
        return False


if __name__ == '__main__':
    logger.setLevel('DEBUG')
    assert len(argv) > 1
    args = parse_args()    
    main(args)

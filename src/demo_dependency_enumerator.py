#!/usr/bin/env python

from sys import argv
import tyrell.spec as S
from tyrell.interpreter import PostOrderInterpreter
from tyrell.enumerator.dependency_enumerator import DependencyEnumerator
from tyrell.decider import Example, SymdiffDecider
from tyrell.synthesizer import Synthesizer
from tyrell.logger import get_logger
from slither.slither import Slither
from verify import check_eq

import sys
sys.path.append("../analysis")

from analyze import analyze, analyze_lambdas
from itertools import combinations 

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

def create_refinement_types(analysis, base_types):
    ref_types = ["Index", "Guard", "Read", "Write"]
    refinement_type_dict = {
        1: "Index",
        2: "Guard",
        3: "Read",
        4: "Write"
    }
    
    final_typ_dict = {}

    # Compute and store all combinations of refinements    
    comb_typs = []
    for i in range(0,len(ref_types)+1):
        comb_typs += combinations(ref_types, i)
    
    # Iterate through dictionary of types --> var for base types (int, arr, etc.)
    for typ, vs in base_types.items():
        for comb_typ in comb_typs:
            if comb_typ:
                final_typ = "{0}__{1}".format("_".join(comb_typ), typ)
            else:
                # No "__" if no refinement
                final_typ = typ
            if not final_typ in final_typ_dict:
                final_typ_dict[final_typ] = []        
            # Iterate through each variable
            for var in vs:
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
                    final_typ_dict[final_typ].append(var)

    # Build output DSL refinement type enums
    typ_enums = ""
    for typ, vs in final_typ_dict.items():
        if vs == []: vs = ["NA"]
        new_typ = '''
        enum {0} {{
            {1}
        }}
        '''.format(typ, ",".join(map(lambda x: '"' + x + '"', vs)))
        typ_enums += new_typ

    return typ_enums, final_typ_dict

        
def instantiate_dsl(sol_file, analysis, lambdas):
## Step 1: parse the original source .sol.
# Init slither
    slither = Slither(sol_file)

# Get the contract, all the contact's name is C by default.
    contract = slither.get_contract_from_name('C')
    harness_fun = contract.functions[0]
    vars_map = {}

# Get the function, which has name 'foo' by default.
    assert harness_fun.name == 'foo'

    for var in harness_fun.variables_read:
        add_var(vars_map, var)

    for var in harness_fun.variables_written:
        add_var(vars_map, var)

    actual_spec = toy_spec_str
    
    int_str = ""
    address_str = ""
    maparray_str = ""
    mapint_str = ""
    prog_decl = ""

    for k in vars_map:
        for v in vars_map[k]:
            prog_decl += k + ' ' + v + '; \n'

    base_types = {
        "int": ["NA"],
        "address": ["NA"],
        "MapInt": ["NA"],
        "MapArray": ["NA"]
    }    
    for k in vars_map:
        v = map(lambda x: '"' + x + '"', vars_map[k]) 
        actual_symbols = ",".join(list(v))
        print('parsing key:', k, ",".join(list(v)))
        if k == 'uint256':
            int_str = actual_symbols
            base_types["int"] = actual_symbols.split(",")
        elif k == 'address':
            address_str = actual_symbols
            base_types["address"] = actual_symbols.split(",")
        elif k == 'mapping(uint256 => uint256)':
            mapint_str = actual_symbols
            base_types["MapInt"] = actual_symbols.split(",")
        elif k == 'mapping(address => uint256[])':
            maparray_str = actual_symbols
            base_types["MapArray"] = actual_symbols.split(",")
        else:
            pass

    typ_enums, final_typ_dict = create_refinement_types(analysis, base_types)        

    if lambdas != []:
        typ_enums += '''
            enum Lambda {{
                {0}
            }}
        '''.format(','.join(map(lambda x: '"{0}"'.format(x), lambdas)))
    
    actual_spec = actual_spec.format(types=typ_enums)

    print(actual_spec)
    print(lambdas)    
    
    return actual_spec, prog_decl, final_typ_dict

toy_spec_str = '''

{types}

value Inst;
value Stmt;
value Empty;
value endInt;
value Array;

program SymDiff(Stmt) -> Inst;
func addressToArray: Array -> MapArray, address;
func addressToInt: endInt -> MapInt, address;
func MAPLAMBDA: Inst -> Write__MapInt, Read__int, Read__int, Lambda;
'''

extra = '''
func INCRANGE: Inst -> Read__MapInt, Read__int, Write__MapInt, Read__int, Read__int;
func COPYRANGE: Inst -> Read__MapInt, Read__int, Write__MapInt, Read__int, Read__int;
func SUM: Inst -> Write__int, Read__MapInt, Read__int, Read__int;
func SHIFTLEFT: Inst -> Read_Write__MapInt, Read__int, Read__int;
func UPDATERANGE: Inst -> Index_Read__MapInt, Write__MapInt, Read__int, Read__int, Read__int;
func MAP: Inst -> Write__MapInt, Read__int, Read__int, Read__int;
'''


class SymDiffInterpreter(PostOrderInterpreter):

    program_decl = ""

    contract_prog = """pragma solidity ^0.5.10;

        contract C {{
            
            {_decl}

            function foo() public {{

                {_body}

            }}
        }}"""

    def __init__(self, decl=""):
        self.program_decl = decl

    def eval_const(self, node, args):
        return args[0]

    def eval_plus(self, node, args):
        return args[0] + '+' + args[1]

    def eval_minus(self, node, args):
        return args[0] + '-' + args[1]

    def eval_mult(self, node, args):
        return args[0] + '*' + args[1]
    
    def eval_addressToArray(self, node, args):
        return args[0] + '[' + args[1] + ']'

    def eval_addressToInt(self, node, args):
        return args[0] + '[' + args[1] + ']'

    def eval_SUM(self, node, args):
        acc = args[0]
        arr = args[1]
        start_idx = args[2]
        end_idx = args[3]

        loop_body = """
            {tgtAcc} = 0;
            for (uint i = {tgtStart}; i < {tgtEnd}; ++i) {{
                {tgtAcc} += {srcArr}[i];
            }}
        """.format(tgtStart=start_idx, tgtEnd=end_idx, tgtAcc=acc, srcArr=arr)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract
    
    def eval_COPYRANGE(self, node, args):        
        src_array = args[0]
        start_src = args[1]
        tgt_array = args[2]
        start_tgt = args[3]
        end_tgt = args[4]
        
        loop_body = """
            for (uint i = {tgtStart}; i < {tgtEnd}; ++i) {{
                {tgtObj}[i] = {srcObj}[i+{srcStart}-{tgtStart}];
            }}
        """.format(tgtStart=start_tgt, tgtEnd=end_tgt, tgtObj=tgt_array,
                   srcStart=start_src, srcObj=src_array)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract

    def eval_SHIFTLEFT(self, node, args):        
        src_array = args[0]
        start_idx = args[1]
        end_idx = args[2]

        loop_body = """
            for (uint i = {start}; i < {end}; i++) {{
                {arr}[i] = {arr}[i+1];
            }}
        """.format(start=start_idx, end=end_idx, arr=src_array)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract

    def eval_UPDATERANGE(self, node, args):        
        cont = args[0]
        tgt = args[1]
        start = args[2]
        end = args[3]
        val = args[4]

        loop_body = """
            for (uint i = {startIdx}; i < {endIdx}; i++) {{
                {tgtArr}[{contArr}[i]] = {newVal};
            }}
        """.format(tgtArr=tgt, contArr=cont, startIdx=start, endIdx=end, newVal=val)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract

    def eval_MAP(self, node, args):        
        tgt = args[0]
        start = args[1]
        end = args[2]        
        val = args[3]

        loop_body = """
            for (uint i = {start_idx}; i < {end_idx}; i++) {{
                {tgtArr}[i] = {newVal};
            }}
        """.format(tgtArr=tgt, start_idx=start, end_idx=end, newVal=val)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract

    def eval_INCRANGE(self, node, args):        
        src = args[0]
        start_src = args[1]
        tgt = args[2]
        start_tgt = args[3]
        end_tgt = args[4]        

        loop_body = """
            for (uint i = {tgtStart}; i < {tgtEnd}; i++) {{
                {tgtArr}[i] += {srcArr}[i+{srcStart}-{tgtStart}];
            }}
        """.format(tgtArr=tgt, tgtStart=start_tgt, tgtEnd=end_tgt,
                   srcArr=src, srcStart=start_src)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract

    def eval_MAPLAMBDA(self, node, args):        
        tgt = args[0]
        start = args[1]
        end = args[2]        
        lam = args[3]

        lam = lam[lam.index(":")+2:].replace("__x", "{0}[i]".format(tgt))
        
        loop_body = """
            for (uint i = {start_idx}; i < {end_idx}; i++) {{
                {tgtArr}[i] = {newVal};
            }}
        """.format(tgtArr=tgt, start_idx=start, end_idx=end, newVal=lam)

        actual_contract = self.contract_prog.format(_body=loop_body, _decl=self.program_decl)

        # print(actual_contract)
        # assert False
        return actual_contract

    

def execute(interpreter, prog, args):
    return interpreter.eval(prog, args)


def test_all(interpreter, prog, inputs, outputs):
    return all(
        execute(interpreter, prog, inputs[x]) == outputs[x]
        for x in range(0, len(inputs))
    )


def main(sol_file):    
    seed = None
    # assert False

    logger.info('Analyzing Input...')
    deps, refs = analyze(sol_file, "C", "foo()")
    lambdas = analyze_lambdas(sol_file, "C", "foo()")
    logger.info('Analysis Successful!')

    actual_spec, prog_decl, types = instantiate_dsl(sol_file, refs.types, lambdas)
    
    logger.info('Parsing Spec...')
    spec = S.parse(actual_spec)
    logger.info('Parsing succeeded')

    logger.info('Building synthesizer...')
    synthesizer = Synthesizer(
        enumerator=DependencyEnumerator(
            spec, max_depth=4, seed=seed, analysis=deps.dependencies, types=types),
        decider=SymdiffDecider(
            interpreter=SymDiffInterpreter(prog_decl), example=sol_file, equal_output=check_eq)
    )
    logger.info('Synthesizing programs...')

    prog = synthesizer.synthesize()
    if prog is not None:
        logger.info('Solution found: {}'.format(prog))
    else:
        logger.info('Solution not found!')


if __name__ == '__main__':
    logger.setLevel('DEBUG')
    assert len(argv) > 1
    main(argv[1])

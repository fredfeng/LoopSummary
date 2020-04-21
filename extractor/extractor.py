import argparse
import os
import json
import re

BENCHMARK_OUT_PATH = os.path.join('.', 'test')
BENCHMARK_IN_PATH = os.path.join('..', 'examples', 'safemath')

new_contract='''
pragma solidity ^0.5.10;

{imports}

contract C {{
  {using}

  {structs}

  {global_vars}

  function foo() public {{
    {loop}
  }}
}}

//#LOOPVARS: {loop_vars}
'''

extra_contract='''
contract {0} {{ }}
'''

solc4_command = os.path.join('/', 'usr', 'local', 'bin', 'solc-0.4')
solc5_command = os.path.join('/', 'usr', 'local', 'bin', 'solc-0.5')
sif_command = os.path.join('SIF2', 'build', 'sif', 'sif')
null_out = os.path.join('/', 'dev', 'null')
temporary_json = os.path.join('.', 'tmp.json')
temporary_ast = os.path.join('.', 'tmp.ast')

replace_safemath = False
add_safemath = False

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", help="solidity file path from which to extract a loop", type=str)
    parser.add_argument("--folder", help="folder from which to extract a loop", type=str)
    parser.add_argument("--replace_safemath", help="when activated, safemath ops will be replaced with regular operations", action="store_true")
    parser.add_argument("--add_safemath", help="when activated, safemath import will be added (at ./SafeMath.sol) if detected in loop and using clause for uint256 will be added", action="store_true")
    return parser.parse_args()

def main():
    global replace_safemath, add_safemath
    args = parse_args()
    if args.replace_safemath:
        replace_safemath = True
    if args.add_safemath:
        add_safemath = True

    if args.file:
        print("Extracting loop from {0}.".format(args.file))
        extract_loops(args.file)
    elif args.folder:
        print("Extracting loop from {0}.".format(args.folder))        
        extract_loops_from_folder(args.folder)

def get_var_types(types):
    all_types = []
    for typ in types:
        matches = re.findall(r"(mapping\((.*) => (.*)\))", typ)
        # TODO: handle nested mappings?
        if matches != []:
            typ1 = matches[0][1].replace("(", "").replace(")", "").replace("[]", "")
            typ2 = matches[0][2].replace("(", "").replace(")", "").replace("[]", "")
            all_types.append(typ1)
            all_types.append(typ2)
        else:
            if typ != "":
                typ = typ.replace("(", "").replace(")", "").replace("[]", "")
                all_types.append(typ)

    return list(set(all_types))

def extract_loop_info(sif_output):
    source = sif_output[0][0]
    info = sif_output[0][1]
    
    used = re.findall("USED: (.*)", info)[0].split(",")
    decd = re.findall("DECLARED: (.*)", info)[0].split(",")
    funcs = re.findall("FUNCTIONS: (.*)", info)[0].split(",")
    structs_used = re.findall("STRUCTS: (.*)", info)[0].split(",")
    it = re.findall("ITERATOR: (.*)", info)[0]
    size = int(re.findall("SIZE: (.*)", info)[0])
    loop_dec = int(re.findall("LOOP DEC: (.*)", info)[0])    

    structs_src = sif_output[0][2].split("$$$$$$$$$$$$$")
    
    return LoopInfo(used, decd, funcs, structs_used, it,
                    size, loop_dec, source, structs_src)

def update_safemath(loop_info):
    safemath_funcs = {"add": "+", "mul": "*", "div": "/", "sub": "-", "mod": "%"}

    # Keep track of all safemath calls
    safemath_calls = []
    # Sort function calls by length, so we know we replace shortest first
    funcs_called = sorted(loop_info.funcs, key=lambda x: len(x))

    for i, func_call in enumerate(funcs_called):
        for safe_func, repl in safemath_funcs.items():
           splitter = ".{0}(".format(safe_func)
           # If the safemath call is actually used in this function call
           if splitter in func_call:
               split = func_call.split(splitter)
               callee = split[0]
               args = split[1][:-1]
               safemath_calls.append((callee, safe_func, args))
               # Also, go forward through the functions called, and replace this
               #   in place, as when we go to split in future iterations, this will
               #   complicate things
               new_call = "({0}) {1} ({2})".format(callee,safemath_funcs[safe_func],args)
               for j in range(i+1, len(funcs_called)):
                   funcs_called[j] = funcs_called[j].replace(func_call, new_call)
               break                   

    # Do safemath adjustments if flags set and safemath functions used in loop
    if any(map(lambda x: x[1] in safemath_funcs, safemath_calls)):
        for (callee, func, args) in safemath_calls:
            old_call = "{0}.{1}({2})".format(callee, func, args)
            new_call = "({0}) {1} ({2})".format(callee, safemath_funcs[func], args)
            loop_info.source = loop_info.source.replace(old_call, new_call)
    
def parse_sif_output(cname, output):
    contracts = {}

    print(output)
    
    # Split output by loops (last is not loop, but global info, so separate out)
    loop_sep = "****************"
    loops = output.split(loop_sep)
    global_info = loops[-1]
    loops = loops[:-1]

    # Check if we use safemath
    uses_safemath = bool(re.findall("USES SAFEMATH: (.*)", global_info)[0])

    # Imports and libraries used (initialized to empty)
    imports = ""
    using = ""
    
    # Add safemath if requested and actually used
    if uses_safemath and add_safemath:
        imports = 'import "./SafeMath.sol;"'
        using = "using SafeMath for uint256;"        
    
    for i,loop in enumerate(loops):
        sep = "=============="
        loop_parse = re.findall(r"{0}([\s\S]*){0}([\s\S]*){0}([\s\S]*){0}".format(sep), loop)
        source = loop_parse[0][0]

        # Extract relevant loop information
        loop_info = extract_loop_info(loop_parse)
        
        # Extract types from mappings/arrays to add to all types
        all_var_types = get_var_types(loop_info.type_table.values())
        classic_types = ["uint", "uint8", "uint16", "uint32", "uint64", "uint128", "uint256", "bool", "address", "bytes", "bytes8", "bytes16", "bytes32", "bytes64", "bytes128", "bytes256"]

        # Replace safemath if necessary
        if uses_safemath and replace_safemath:
            update_safemath(loop_info)

        # Add any user-defined contracts as necessary
        added_contracts = ""
        for var_type in all_var_types:
            if not var_type in classic_types+loop_info.structs_used:
                added_contracts += extra_contract.format(var_type)

        # Create global variable declarations
        all_vars = set([(typ, var) for (var, typ) in loop_info.type_table.items()])
        should_create_glob = lambda v: not v[1] in loop_info.decd and not (v[1] == loop_info.it and loop_info.loop_dec)
        vars_to_create = filter(should_create_glob, all_vars)
        global_vars = "\n".join(map(lambda y: "{0} {1};".format(y[0],y[1]), vars_to_create))
        
        # Plug the pieces into the contract
        extracted_contract = new_contract.format(global_vars=global_vars, loop=loop_info.source, imports=imports, using=using, loop_vars=loop_info.it, structs=loop_info.structs_source())
        extracted_contract += added_contracts

        # Add new loop contract to contracts, sorting by loop size
        if not loop_info.size in contracts:
            contracts[loop_info.size] = []        
        contracts[loop_info.size].append((i, extracted_contract))
            
        print("--"*8)
        print(cname)
        print(loop_info.size)
        print("--"*8)
        print(extracted_contract)
        print("--"*8)

    return contracts

def extract_loops(cname):
    with open(cname, 'r') as c_file:
        pragma = c_file.readlines()[0][16:]
        pragma = pragma[:-2]
        pragma = pragma.replace("^", "")

    solc_version = "0.5"
    
    if pragma.startswith("0.4"):
        print("Using solc version 0.4")
        solc_version = "0.4"
        solc_command = solc4_command
    elif pragma.startswith("0.5"):
        print("Using solc version 0.5")        
        solc_command = solc5_command
    else:
        print("WARNING: pragma version {0} unrecognized. Using solc version 0.5.".format(pragma))
        solc_command = solc5_command
        
    solc_json_command = '{0} --ast-compact-json {1}'.format(solc_command, cname)
    print("SOLC JSON COMMAND: {0}".format(solc_json_command))
    stream = os.popen(solc_json_command)
    solc_json_output = stream.read()
    solc_json_output = json.loads(solc_json_output[solc_json_output.index('{'):])    

    # Add isConstructor field to FunctionDefinition for solc-0.5
    if solc_version == "0.5":
        for k in solc_json_output["nodes"]:
            if k["nodeType"] == "ContractDefinition":
                for k2 in k["nodes"]:
                    if k2["nodeType"] == "FunctionDefinition":
                        if not "isConstructor" in k2:
                            kind = k2["kind"]
                            k2["isConstructor"] = kind == "constructor"
                        

    with open(temporary_json, "w") as tmp_json:
        json_dict = json.dumps(solc_json_output)
        header = '''
        JSON AST (compact format):


        ======= {0} =======
        '''.format(cname)
        tmp_json.write(header)
        tmp_json.write(json_dict)

    # solc_ast_command = '{0} --ast {1} > {2}'.format(solc_command, cname, temporary_ast)
    # print("SOLC AST COMMAND: {0}".format(solc_ast_command))
    # os.system(solc_ast_command)

    # BEN HACK FIX STARTS FOR PROBLEM WITH uint[2]
    solc_ast_command = '{0} --ast {1}'.format(solc_command, cname)
    print("SOLC AST COMMAND: {0}".format(solc_ast_command))
    stream = os.popen(solc_ast_command)
    solc_ast_output = stream.read()
    lines_to_delete = []
    
    for i,line in enumerate(solc_ast_output.split("\n")):
        if "Type unknown." in line:
            lines_to_delete += [i-1, i, i+1]
            
    out_lines_ast = []
    for i,line in enumerate(solc_ast_output.split("\n")):
        if not i in lines_to_delete:
            out_lines_ast.append(line)

    out_ast = "\n".join(out_lines_ast)
    with open(temporary_ast, "w") as tmp_ast:
        tmp_ast.write(out_ast)
    # BEN HACK FIX ENDS FOR PROBLEM WITH uint[2]
        
    sif_run = '{0} -a {1} -j {2} -o {3}'.format(sif_command, temporary_ast, temporary_json, null_out)
    print("SIF COMMAND: {0}".format(sif_run))
    stream = os.popen(sif_run)
    sif_output = stream.read()

    contracts = parse_sif_output(cname, sif_output)

    if not os.path.exists(BENCHMARK_OUT_PATH):
        os.makedirs(BENCHMARK_OUT_PATH)

    cbasename = os.path.basename(cname)        
    for nl, conts in contracts.items():
        out_path = os.path.join(BENCHMARK_OUT_PATH, str(nl))
        if not os.path.exists(out_path):
            os.makedirs(out_path)

        for (i, cont) in conts:
            fname = "{0}_{1}.sol".format(cbasename.replace(".sol", ""), i)
            with open(os.path.join(out_path, fname), "w") as out_file:
                out_file.write(cont)

            print("Saved {0} in the folder {1}!".format(fname, out_path))
                

def extract_loops_from_folder(folder):
    for fname in os.listdir(folder):
        with open(os.path.join(folder,fname), "r") as src_file:
            src = ''.join(src_file.readlines())
            try:
                extract_loops(os.path.join(folder, fname))
            except Exception as e:
                print("Failed to compile {0}".format(fname))
                print(e)

class LoopInfo:

    def __init__(self, used, decd, funcs, structs_used,
                 it, size, loop_dec, source, structs_src):
        self.type_table = {}
        for entry in used:
            tup = re.findall("(.*):(.*)", entry)
            var = tup[0][0]
            typ = tup[0][1]
            self.type_table[var] = typ
        self.used = self.type_table.keys()        
        self.decd = decd
        self.funcs = funcs
        self.structs_used = structs_used
        self.it = it if it != "" else "i" # Default iterator is i if none found
        self.size = size
        self.loop_dec = bool(loop_dec)
        self.source = source
        self.structs_src = structs_src

    def structs_source(self):
        return "".join(self.structs_src)
                
main()

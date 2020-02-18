import argparse
import os
import json
import re

BENCHMARK_OUT_PATH = os.path.join('.', 'benchmarks')
BENCHMARK_IN_PATH = os.path.join('..', 'examples', 'safemath')

new_contract='''
pragma solidity ^0.5.10;

{imports}

contract C {{
  {using}

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
sif_command = os.path.join('SIF', 'build', 'sif', 'sif')
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

def get_var_types(vars_used):
    types = list(map(lambda x: x[0], vars_used))
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
        
def parse_sif_output(cname, output):
    contracts = {}
    loops = output.split("//#LOOP_END")
    safe_math = False
    safemath_funcs = {"add": "+", "mul": "*", "div": "/", "sub": "-", "mod": "%"}    
    for i, loop in enumerate(loops[:-1]):
        vars_decd = []
        vars_used = []
        funcs_called = []
        loop_vars = []
        num_lines = None
        src = None
        imports = ""
        using = ""
        for line in loop.split("\n"):
            if line.startswith("//#NUMLINES: "):
                num_lines = int(line[13:])
            elif line.startswith("//#USED: "):
                var_and_type = line[9:].split(", ")
                if var_and_type[1] != "":
                    print("No type found for var: {0}".format(var_and_type[0]))
                    vars_used.append((var_and_type[1], var_and_type[0]))
            elif line.startswith("//#DECLARED: "):
                vars_decd.append(line[13:])
            elif line.startswith("//#USINGSAFEMATH"):
                safe_math = True
            elif line.startswith("//#LOOPVAR: "):
                loop_vars.append(line[12:])
            elif line.startswith("//#FUNC: "):
                funcs_called.append(line[9:])
            elif line.startswith("//#LOOP_BEGIN"):
                src = ""                
            elif src != None:
                src += line + "\n"

        # Only analyze function calls if safemath triggered and a safemath flag set
        func_split_called = []
        if safe_math and (replace_safemath or add_safemath):
            funcs_called = sorted(funcs_called, key=lambda x: len(x))
            for i2, func_call in enumerate(funcs_called):
                print(func_call)
                for k in safemath_funcs:
                   splitter = ".{0}(".format(k)
                   if splitter in func_call:
                       func = k
                       split = func_call.split(splitter)
                       callee = split[0]
                       args = split[1][:-1]
                       func_split_called.append((callee, func, args))
                       new_call = "({0}) {1} ({2})".format(callee,safemath_funcs[func],args)
                       for j in range(i2+1, len(funcs_called)):
                           funcs_called[j] = funcs_called[j].replace(func_call, new_call)
                       break                   

        # Do safemath adjustments if flags set and safemath functions used in loop
        if safe_math and any(map(lambda x: x[1] in safemath_funcs,func_split_called)):
            if replace_safemath:
                for (callee, func, args) in func_split_called:
                    old_call = "{0}.{1}({2})".format(callee, func, args)
                    new_call = "({0}) {1} ({2})".format(callee,safemath_funcs[func],args)
                    src = src.replace(old_call, new_call)
            elif add_safemath:
                imports = 'import "./SafeMath.sol;"'
                using = "using SafeMath for uint256;"

        all_var_types = get_var_types(vars_used)
        classic_types = ["uint", "uint8", "uint16", "uint32", "uint64", "uint128", "uint256", "bool", "address", "bytes", "bytes8", "bytes16", "bytes32", "bytes64", "bytes128", "bytes256"]
        # classic_types += list(map(lambda t: t+"[]", classic_types))
        added_contracts = ""
        for var_type in all_var_types:
            if not var_type in classic_types:
                added_contracts += extra_contract.format(var_type)
                
        global_vars = "\n".join(set(map(lambda y: y[0] + " " + y[1] + ";", filter(lambda x: not x[1] in vars_decd, vars_used))))

        extracted_contract = new_contract.format(global_vars=global_vars, loop=src, imports=imports, using=using, loop_vars=loop_vars)
        extracted_contract += added_contracts

        if not num_lines in contracts:
            contracts[num_lines] = []
        
        contracts[num_lines].append((i, extracted_contract))
            
        print("--"*8)
        print(cname)
        print(num_lines)
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

main()

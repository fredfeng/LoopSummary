import argparse
import os
import json

BENCHMARK_OUT_PATH = os.path.join('.', 'benchmarks')
BENCHMARK_IN_PATH = os.path.join('..', 'examples', 'safemath')

new_contract='''
pragma solidity ^0.5.10;

contract C {{

  {global_vars}

  function foo() public {{
    {loop}
  }}
}}
'''

solc4_command = os.path.join('/', 'usr', 'local', 'bin', 'solc-0.4')
solc5_command = os.path.join('/', 'usr', 'local', 'bin', 'solc-0.5')
sif_command = os.path.join('SIF', 'build', 'sif', 'sif')
null_out = os.path.join('/', 'dev', 'null')
temporary_json = os.path.join('.', 'tmp.json')
temporary_ast = os.path.join('.', 'tmp.ast')

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", help="solidity file path from which to extract a loop", type=str)
    parser.add_argument("--folder", help="folder from which to extract a loop", type=str)
    return parser.parse_args()
    

def main():
    args = parse_args()
    if args.file:
        print("Extracting loop from {0}.".format(args.file))
        extract_loops(args.file)
    elif args.folder:
        print("Extracting loop from {0}.".format(args.folder))        
        extract_loops_from_folder(args.folder)
    
def parse_sif_output(cname, output):
    contracts = {}
    loops = output.split("//#LOOP_END")
    for i, loop in enumerate(loops[:-1]):
        vars_decd = []
        vars_used = []
        num_lines = None
        src = None        
        for line in loop.split("\n"):
            if line.startswith("//#NUMLINES: "):
                num_lines = int(line[13:])
            elif line.startswith("//#USED: "):
                var_and_type = line[9:].split(", ")
                vars_used.append((var_and_type[1], var_and_type[0]))
            elif line.startswith("//#DECLARED: "):
                vars_decd.append(line[13:])
            elif line.startswith("//#LOOP_BEGIN"):
                src = ""
            elif src != None:
                src += line + "\n"

        global_vars = "\n".join(set(map(lambda y: y[0] + " " + y[1] + ";", filter(lambda x: not x[1] in vars_decd, vars_used))))

        extracted_contract = new_contract.format(global_vars=global_vars, loop=src)

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

    solc_ast_command = '{0} --ast {1} > {2}'.format(solc_command, cname, temporary_ast)
    print("SOLC AST COMMAND: {0}".format(solc_ast_command))
    os.system(solc_ast_command)

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
            extract_loops(os.path.join(folder, fname))

main()

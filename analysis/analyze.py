from slither import Slither
from dependency import Dependency
from refinement import Refinement

import argparse

def setupArgs():
    parser = argparse.ArgumentParser(description='Run dependency and refinement analysis on solidity loops.')
    parser.add_argument('--f', type=str, dest='fname', required=True,
                        help='file with loop to be analyzed')
    parser.add_argument('--c', type=str, default='MyContract', dest='cname',
                        help='name of contract in file')
    parser.add_argument('--func', type=str, default='foo()', dest='funcname',
                        help='name of function in file')
    parser.add_argument('--print', default=False, action='store_true',
                        dest='print_output', help='name of function in file')

    args = parser.parse_args()    

    return args

def analyze(fname, cname='MyContract', funcname='foo()'):
    slither = Slither(fname)

    myContract = slither.get_contract_from_name(cname)
    funcA = myContract.get_function_from_signature(funcname)

    # Dependency Analysis
    D = Dependency()
    D.compute_contract(myContract, slither)
    D.dependencies = funcA.context[D.KEY_NON_SSA]        

    # Refinement Analysis
    R = Refinement()
    R.compute_contract(myContract, slither)

    # For Guard Types, use Dependency Analysis to fetch all vars which affect
    #   the Guard (i.e. on which the guard depends)
    guards = []
    for var in R.types[R.Typ.GUARD]:
        if var in D.dependencies:
            guards += D.dependencies[var]
    R.types[R.Typ.GUARD] += guards

    # Remove temporary variables and ref vars from types
    for typ in R.types:
        for var in R.types[typ]:
            if var.name.startswith("REF") or var.name.startswith("TMP"):
                R.types[typ].remove(var)

    # Remove temporary variables and ref vars from dependencies
    to_delete = []
    for var in D.dependencies:
        if var.name.startswith("REF") or var.name.startswith("TMP"):
            to_delete.append(var)
        else:
            to_delete2 = []
            for var2 in D.dependencies[var]:
                if var2.name.startswith("REF") or var2.name.startswith("TMP"):
                    to_delete2.append(var2)
            for x in to_delete2: D.dependencies[var].remove(x)
            if len(D.dependencies[var]) == 0: to_delete.append(var)
    for x in to_delete:
        D.dependencies.pop(x, None)

    # Fetch written and read types from dependencies
    R.types[R.Typ.WRITTEN] += D.dependencies.keys()
    R.types[R.Typ.READ] = [x for vals in D.dependencies.values() for x in vals]

    # Anything that is an index or guard is also read
    R.types[R.Typ.READ] += R.types[R.Typ.INDEX]
    R.types[R.Typ.READ] += R.types[R.Typ.GUARD]    
        
    # Reformat refinement type entries
    R_types_formatted = {}
    for typ, vrs in R.types.items():
        R_types_formatted[typ] = set(map(str, vrs))
    R.types = R_types_formatted
        
    # Reformat dependencies entries
    dependencies_formatted = {}
    for v, vrs in D.dependencies.items():
        dependencies_formatted[str(v)] = set(map(str, vrs))
    D.dependencies = dependencies_formatted
        
    return D, R    

if __name__ == '__main__':
    args = setupArgs()
    D, R = analyze(args.fname, args.cname, args.funcname)
    if args.print_output:        
        D.pprint_dependency()
        R.pprint_refinement()

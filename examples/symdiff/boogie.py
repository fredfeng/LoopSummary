import sys
import os
import re

symdiff = 'mono ~/research/other/symdiff/Sources/SymDiff/bin/x86/Debug/SymDiff.exe'
dotnet = '~/Downloads/dotnet-sdk-2.2.402-osx-x64/dotnet' 
verisol = '~/research/other/verisol/bin/Debug/VeriSol.dll'

def compile(filename, bpl):
    compile_cmd = '{dotnet_cmd} {verisol_loc} {file} C /noChk /noInlineAttrs /removeScopeInVarName /omitSourceLineInfo /omitDataValuesInTrace /omitUnsignedSemantics /omitAxioms /omitHarness'.format(dotnet_cmd = dotnet, verisol_loc = verisol, file=filename)
    print(compile_cmd)
    os.system(compile_cmd)
    os.system('cp __SolToBoogieTest_out.bpl {b_name}'.format(b_name=bpl))

def clean():
    os.system('rm *.bpl')

def main(argv):
    print('File1: ', argv[0])
    print('Step1: compiling contracts using VeriSol...')
    compile(argv[0], 'C1.bpl')

    # Clean up 
    #clean()

if __name__ == "__main__":
    main(sys.argv[1:])

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

def main(argv):
    print('File1: ', argv[0])
    print('File2: ', argv[1])
    print('Step1: compiling contracts using VeriSol...')
    compile(argv[0], 'C1.bpl')
    compile(argv[1], 'C2.bpl')

    print('Step2: verifying contracts using SymDiff...')
    extract_loop_cmd = '{symdiff_cmd} -extractLoops C1.bpl _v1.bpl'.format(symdiff_cmd = symdiff)
    os.system(extract_loop_cmd)
    extract_loop_cmd2 = '{symdiff_cmd} -extractLoops C2.bpl _v2.bpl'.format(symdiff_cmd = symdiff)
    os.system(extract_loop_cmd2)
    infer_cmd = '{symdiff_cmd} -inferConfig _v1.bpl _v2.bpl > _v1_v2.config'.format(symdiff_cmd = symdiff)
    os.system(infer_cmd)
    allInOne_cmd = '{symdiff_cmd} -allInOne  _v1.bpl _v2.bpl _v1_v2.config -usemutual -checkEquivWithDependencies -freeContracts -checkEquivForRoots -main:foo_C >> C1C2.log'.format(symdiff_cmd = symdiff)
    os.system(allInOne_cmd)

    lastline = ''
    with open('C1C2.log') as f:
        data = f.readlines()
        lastline = data[-1]

    nums = re.findall(r'\d+', lastline)
    # print(lastline, nums)
    print('Step3: Analyzing results...')
    if nums[1] == '0':
        print('PASS: Two programs are equivalent!')
    else:
        print('FAIL: Two programs are NOT equivalent!')

if __name__ == "__main__":
    main(sys.argv[1:])
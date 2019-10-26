## Install VeriSol and Symdiff
* Download and build VeriSol from Sources (don't use the nuget package, as it will be stale) from [here](https://github.com/microsoft/verisol/blob/master/INSTALL.md)
* Follow instructions to download symdiff [instructions for Windows, Yu will write MacOS instructions here, or directly on symdiff page](https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md)

* MacOS instructions for installing symdiff
  * Prerequisites
    * Install [Z3 binary](https://github.com/Z3Prover/z3/releases) and copy Z3.exe (>= version 4.1) into the            
    * and {dependency, rootcause}\bin\debug\  //TODO: keep in a centralized area
	   * Z3 4.1 is currently needed for Rootcause. //TODO: fix prover errors related to 'relax_0' variables

## End to end flow

Command for checking two programs:
```
cd examples/symdiff
python3 check_eq.py benchmark1/C1.sol benchmark1/C2.sol
```

Command for verifying all existing benchmarks:
```
cd examples/symdiff
sh regression.sh
```
 
## Step-by-step flow
### Run VeriSol to generate pair of BPL files
Go to *benchmark1*
* `dotnet %VerisolPath%/bin/debug/VeriSol.dll C1.sol C /noChk /noInlineAttrs /removeScopeInVarName /omitSourceLineInfo /omitDataValuesInTrace /omitUnsignedSemantics /omitAxioms /omitHarness` 
* `cp __SolToBoogieTest_out.bpl  C1.bpl`
* `dotnet %VerisolPath%/bin/debug/VeriSol.dll C2.sol C /noChk /noInlineAttrs /removeScopeInVarName /omitSourceLineInfo /omitDataValuesInTrace /omitUnsignedSemantics /omitAxioms /omitHarness` 
* `cp __SolToBoogieTest_out.bpl  C2.bpl`

> Note, all the sol files should have same contract, function and global variable names. Otherwise, SymDiff will not be able to match the procedures. 

### Run SymDiff on the pair of BPL files to check equivalence (to check inequivalence, replace C2 by C3 below)
* `mono symdiff.exe -extractLoops C1.bpl _v1.bpl`
* `mono symdiff.exe -extractLoops C2.bpl _v2.bpl`
* `mono symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config`
* `mono symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts -checkEquivForRoots -main:foo_C >> C1C2.log`

>  We are assuming that the contract name is always **C** and the method name is **Foo**

When verification succeeds, the following string "Houdini finished with.*, 0 errors, 0 inconclusives, 0 timeouts" is present
   *  When two procedures are not equivalent (e.g. C1C3.log), you should see `Houdini finished with xxxx verified, 1 errors, 0 inconclusives, 0 timeouts`
   *  When two procedures are equivalent (e.g. C1C2.log), you should see `Houdini finished with xxx verified, 0 errors, 0 inconclusives, 0 timeouts`

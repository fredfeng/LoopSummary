## Install VeriSol and Symdiff
* Download and build VeriSol from Sources (don't use the nuget package, as it will be stale) from [here](https://github.com/microsoft/verisol/blob/master/INSTALL.md)
* Follow instructions to download symdiff [instructions for Windows, Yu will write MacOS instructions here, or directly on symdiff page](https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md)

* MacOS instructions for installing symdiff
  * Prerequisites
    * Make sure you have already install the donet SDK 2.2 (It won't work for the latest SDK!)
    * Download and install [VisualStudio](https://visualstudio.microsoft.com/)
    * Install Mono from this [link](https://www.mono-project.com/download/stable/)
    * Install [Z3 binary](https://github.com/Z3Prover/z3/releases) and create its symbolic link under %SymdiffPath%/Sources/references/:
    ```
    ln -s /usr/local/bin/z3 %SymdiffPath%/Sources/references/z3.exe
    ```
    * Install Boogie by following the instructions in [here](https://github.com/boogie-org/boogie), and then copy the binaries to symdiff via:
    ```
    cp %BoogiePath%/binaries/* %SymdiffPath%/Sources/references/
    ```
	   
* Open Sources/SymDiff.sln in Visual Studio and select "Build -> Build SymDiff"


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

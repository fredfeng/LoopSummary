## Install VeriSol and Symdiff
* Download and build VeriSol from Sources (don't use the nuget package, as it will be stale) from [here](https://github.com/microsoft/verisol/blob/master/INSTALL.md)
* Follow instructions to download symdiff [instructions for Windows, Yu will write MacOS instructions here, or directly on symdiff page](https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md)
 
## End to end flow
### Run VeriSol to generate pair of BPL files
Go to *benchmark1*
* dotnet %VerisolPath%/bin/debug/VeriSol.dll C1.sol C1 /noChk /noInlineAttrs /removeScopeInVarName 
* cp `__SolToBoogieTest_out.bpl` to C1.bpl
* dotnet %VerisolPath%/bin/debug/VeriSol.dll C2.sol C2 /noChk /noInlineAttrs /removeScopeInVarName 
* cp `__SolToBoogieTest_out.bpl` to C2.bpl

### Run SymDiff on the pair of BPL files to check equivalence
* `mono symdiff.exe -extractLoops C1.bpl _v1.bpl`
* `mono symdiff.exe -extractLoops C2.bpl _v2.bpl`
* `mono symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config`
* `mono symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts -checkEquivForRoots >> C1C2.log`

When verification succeeds, the following string "Houdini finished with.*, 0 errors, 0 inconclusives, 0 timeouts" is present C1C2.log. 
   *  When two procedures are not equivalent (e.g. ex1, ex3), you should see `Houdini finished with 5 verified, 1 errors, 0 inconclusives, 0 timeouts`
   *  When two procedures are equivalent (e.g. ex1, ex2), you should see `Houdini finished with 6 verified, 0 errors, 0 inconclusives, 0 timeouts`

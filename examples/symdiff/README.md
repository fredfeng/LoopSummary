## Install symdiff
* Follow instructions to download symdiff [instructions for Windows, Yu will write MacOS instructions here, or directly on symdiff page]

 https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md
 

## For the example pair (ex1.bpl, ex2.bpl)
  - Had to remove {:inline 1} in both files // VeriSol has an option to remove this /noInlineAttr
  - Had to rename i_s56 to i_s55                   // VeriSol needs an option


## To run SymDiff on a pair of BPL files

* `mono symdiff.exe -extractLoops ex1.bpl _v1.bpl`
* `mono symdiff.exe -extractLoops ex2.bpl _v2.bpl`
* `mono symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config`
* `mono symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts -checkEquivForRoots >> ex1ex2.log`

When verification succeeds, the following string "Houdini finished with.*, 0 errors, 0 inconclusives, 0 timeouts" is present ex1ex2.log. 
   *  When two procedures are not equivalent (e.g. ex1, ex3), you should see `Houdini finished with 5 verified, 1 errors, 0 inconclusives, 0 timeouts`
   *  When two procedures are equivalent (e.g. ex1, ex2), you should see `Houdini finished with 6 verified, 0 errors, 0 inconclusives, 0 timeouts`

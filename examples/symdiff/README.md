## Install symdiff
* Follow instructions to download symdiff [instructions for Windows, Yu will write MacOS instructions here, or directly on symdiff page]

 https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md
 

## To run SymDiff on a pair of BPL files

### For the example pair (ex1.bpl, ex2.bpl)
  - Had to remove {:inline 1} in both files // VeriSol has an option to remove this /noInlineAttr
  - Had to rename i_s56 to i_s55                   // VeriSol needs an option


  
 
 #### Windows
 * Follow instructions here (Windows) https://github.com/boogie-org/symdiff/blob/master/docs/SymDiff.md
  `run_symdiff_bpl ex1 ex2 /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts"`

 #### On Mac

`symdiff.exe -extractLoops ex1.bpl _v1.bpl`

`symdiff.exe -extractLoops ex2.bpl _v2.bpl`

`symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config`

`symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts >> ex1ex2.log`


* Inspect the file mergedProgSingle_inferred.bpl and inspect the postconditions of **MS_Check__ex1.foo_C1___ex2.foo_C1**, where **foo** is the method in contract **C**
  Look for "Houdini-Inferred DAC Candidate" in the "free ensures". It tells which of the global variables are preserved by the method. If **M_int_int** set of variables are preserved (either == or not in the modifies set), then the two programs are equivalent. 
  
 


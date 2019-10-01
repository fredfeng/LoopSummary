To run SymDiff

* Follow instructions to download symdiff [may need Windows]
 https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md
 

* For the example pair (ex1.bpl, ex2.bpl)
  - Remove {:inline 1} in both files
  - Rename i_s56 to i_s55

* Follow instructions here (Windows)
  https://github.com/boogie-org/symdiff/blob/master/docs/SymDiff.md

  run_symdiff_bpl ex1 ex2 /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts"

To run SymDiff (on Mac)

symdiff.exe -extractLoops ex1.bpl _v1.bpl
symdiff.exe -extractLoops ex2.bpl _v2.bpl
symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config
symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts >> ex1ex2.log
References/boogie.exe /noinfer /contractInfer /printAssignment mergedProgSingle.bpl >> ex1ex2.log



* Inspect the file mergedProgSingle_inferred.bpl and inspect the postconditions of **MS_Check__ex1.foo_C1___ex2.foo_C1**, where **foo** is the method in contract **C**
  Look for "Houdini-Inferred DAC Candidate" in the "free ensures". It tells which of the global variables are preserved by the method. If **M_int_int** set of variables are preserved (either == or not in the modifies set), then the two programs are equivalent. 
  
 


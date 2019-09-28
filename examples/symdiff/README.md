To run SymDiff

* Follow instructions to download symdiff [may need Windows]
 https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md
 

* For the example pair (c1.bpl, c2.bpl)
  - Remove {:inline 1} in both files
  - Rename i_s56 to i_s55

* Follow instructions here
  https://github.com/boogie-org/symdiff/blob/master/docs/SymDiff.md

  run_symdiff_bpl c1 c2 /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts"

* Inspect the file mergedProgSingle_inferred.bpl and inspect the postconditions of **MS_Check__v1.foo_C1___v2.foo_C1**, where **foo** is the method in contract **C**
  Look for "Houdini-Inferred DAC Candidate" in the "free ensures". It tells which of the global variables are preserved by the method
  
 
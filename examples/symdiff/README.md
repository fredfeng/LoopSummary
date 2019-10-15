To run SymDiff

* Follow instructions to download symdiff [may need Windows]
 https://github.com/boogie-org/symdiff/blob/master/docs/Documentation.md
 
* [TODO] To be automated in VeriSol front end
  For the example pair (ex1.bpl, ex2.bpl)
  - Remove {:inline 1} in both files **/noInlineAttr**
  - Rename i_s56 to i_s55  **/stripScopeInVarName**

* To run SymDiff

`symdiff.exe -extractLoops ex1.bpl _v1.bpl`
`symdiff.exe -extractLoops ex2.bpl _v2.bpl`
`symdiff.exe -inferConfig _v1.bpl _v2.bpl > _v1_v2.config`
`symdiff.exe -allInOne _v1.bpl _v2.bpl _v1_v2.config  -usemutual -checkEquivWithDependencies -freeContracts -checkEquivForRoots >> ex1ex2.log`

When verification succeeds, the following string "Houdini finished with.*, 0 errors, 0 inconclusives, 0 timeouts" is present ex1ex2.log. 
   *  When two procedures are not equivalent (e.g. ex1, ex3), you should see `Houdini finished with 5 verified, 1 errors, 0 inconclusives, 0 timeouts`
   *  When two procedures are equivalent (e.g. ex1, ex2), you should see `Houdini finished with 6 verified, 0 errors, 0 inconclusives, 0 timeouts`

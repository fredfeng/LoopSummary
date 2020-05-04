






contract C {
  

  

  mapping(uint256 => SAMdatasets.Round) gd_RndData;
uint256 gu_RID;

  function foo() public {
    
while(gd_RndData[gu_RID].end < now + 1800){
gd_RndData[gu_RID].end += 7200;
}

  }

  

}

//#LOOPVARS: i



contract SAMdatasets.Round { }

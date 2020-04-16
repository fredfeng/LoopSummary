
pragma solidity ^0.5.10;



contract C {
  

  uint256 gu_RID;
mapping(uint256 => SAMdatasets.Round) gd_RndData;

  function foo() public {
    
while(gd_RndData[gu_RID].end < now + 1800){
gd_RndData[gu_RID].end += 7200;
}

  }
}

//#LOOPVARS: 

contract SAMdatasets.Round { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 e;
uint256 s;
mapping(uint256 => SAMdatasets.Round) gd_RndData;
uint256 i;
uint256 num;
uint256 rID;

  function foo() public {
    
for(uint256 i = s; i <= e; i++){
if (gd_RndData[rID].d_num[i] > 30) {
num = (num) + (31 << ((i - s) * 5));
} else if (gd_RndData[rID].d_num[i] > 0) {
num = (num) + (gd_RndData[rID].d_num[i] << ((i - s) * 5));
}


}


  }
}

//#LOOPVARS: i

contract SAMdatasets.Round { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 gu_RID;
uint256 pID;
uint256 e;
mapping(uint256 => mapping(uint256 => SAMdatasets.PlayerRounds)) gd_PlyrRnd;
uint256 s;
uint256 i;
uint256 num;

  function foo() public {
    
for(uint256 i = s; i <= e; i++){
if (gd_PlyrRnd[pID][gu_RID].d_num[i] > 30) {
num = (num) + (31 << ((i - s) * 5));
} else if (gd_PlyrRnd[pID][gu_RID].d_num[i] > 0) {
num = (num) + (gd_PlyrRnd[pID][gu_RID].d_num[i] << ((i - s) * 5));
}


}


  }
}

//#LOOPVARS: i

contract SAMdatasets.PlayerRounds { }

contract uint256 => mappinguint256 { }

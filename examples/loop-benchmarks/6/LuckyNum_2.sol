
pragma solidity ^0.5.10;



contract C {
  

  uint256 cnt;
uint256 gu_RID;
uint256 pID;
mapping(uint256 => mapping(uint256 => SAMdatasets.PlayerRounds)) gd_PlyrRnd;
mapping(uint256 => SAMdatasets.Round) gd_RndData;
uint256 i;
uint256 num1;
uint256 t_cnt;

  function foo() public {
    
for(i = 1; i <= 50 && num1 > 0; i++){
cnt = (num1 & 0x1F);
if (cnt > 0) {
t_cnt = (cnt) + (t_cnt);
gd_PlyrRnd[pID][gu_RID].d_num[i] = (cnt) + (gd_PlyrRnd[pID][gu_RID].d_num[i]);
gd_RndData[gu_RID].d_num[i] = (cnt) + (gd_RndData[gu_RID].d_num[i]);
}

num1 = (num1 >> 5);
}


  }
}

//#LOOPVARS: i

contract SAMdatasets.PlayerRounds { }

contract SAMdatasets.Round { }

contract uint256 => mappinguint256 { }

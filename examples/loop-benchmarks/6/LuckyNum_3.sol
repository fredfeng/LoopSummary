
pragma solidity ^0.5.10;



contract C {
  

  uint256 cnt;
uint256 gu_RID;
uint256 pID;
mapping(uint256 => mapping(uint256 => SAMdatasets.PlayerRounds)) gd_PlyrRnd;
mapping(uint256 => SAMdatasets.Round) gd_RndData;
uint256 i;
uint256 t_cnt;
uint256 num2;

  function foo() public {
    
for(i = 51; i <= 100 && num2 > 0; i++){
cnt = (num2 & 0x1F);
if (cnt > 0) {
t_cnt = (cnt) + (t_cnt);
gd_PlyrRnd[pID][gu_RID].d_num[i] = (cnt) + (gd_PlyrRnd[pID][gu_RID].d_num[i]);
gd_RndData[gu_RID].d_num[i] = (cnt) + (gd_RndData[gu_RID].d_num[i]);
}

num2 = (num2 >> 5);
}


  }
}

//#LOOPVARS: i

contract SAMdatasets.PlayerRounds { }

contract SAMdatasets.Round { }

contract uint256 => mappinguint256 { }

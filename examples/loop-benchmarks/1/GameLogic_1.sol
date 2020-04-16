
pragma solidity ^0.5.10;



contract C {
  

  Datasets.Beter[] winBetters;
uint j;
uint256 len;
uint256 perAmountAward;

  function foo() public {
    
for(uint j = 0; j < len; j++){
addCoin(winBetters[j].betId, (perAmountAward) * (winBetters[j].amount), Datasets.CoinOpTypeEnum.WIN_AWARD);
}


  }
}

//#LOOPVARS: j

contract Datasets.Beter { }

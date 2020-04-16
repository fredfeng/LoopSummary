
pragma solidity ^0.5.10;



contract C {
  

  Datasets.Beter[] winBetters;
uint k;
uint perAward;

  function foo() public {
    
for(uint k = 0; k < winBetters.length; k++){
Datasets.Beter item1 = winBetters[k];
if (item1.betId == 0) break;

addCoin(item1.betId, (perAward) * (item1.amount), Datasets.CoinOpTypeEnum.LUCKY_AWARD);
}


  }
}

//#LOOPVARS: k

contract Datasets.Beter { }

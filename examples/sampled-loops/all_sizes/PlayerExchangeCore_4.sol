
pragma solidity ^0.5.10;



contract C {
  

  PlayerToken[] playerTokenContracts_;
uint8 _fee;
uint startIndex;
uint endIndex;
uint i;

  function foo() public {
    
for(uint i = startIndex; i < endIndex; i++){
PlayerToken playerTokenContract = playerTokenContracts_[i];
playerTokenContract.setSellDividendPercentageFee(_fee);
}


  }
}

//#LOOPVARS: i

contract PlayerToken { }

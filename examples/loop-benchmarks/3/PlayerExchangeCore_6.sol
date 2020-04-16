
pragma solidity ^0.5.10;



contract C {
  

  PlayerToken[] playerTokenContracts_;
uint playerContractCount;
address _address;
PlayerToken playerTokenContract;
uint[] totalValue;
uint[] playerTokenContractIds;
int[] totalCost;
uint i;
uint[] totalTokens;

  function foo() public {
    
for(uint i = 0; i < playerContractCount; i++){
playerTokenContract = playerTokenContracts_[i];
playerTokenContractIds[i] = i;
(totalTokens[i], totalCost[i], totalValue[i]) = playerTokenContract.portfolioSummary(_address);
}


  }
}

//#LOOPVARS: i

contract PlayerToken { }

contract int { }

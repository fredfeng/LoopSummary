
pragma solidity ^0.5.10;



contract C {
  

  AthCrowdsaleInterface crowdsaleInterface;
uint256 i;
uint256 remainder;

  function foo() public {
    
for(uint256 i = 0; i <= crowdsaleInterface.investorsCount() - 1; i++){
crowdsaleInterface.investorsAddress(i).transfer(((remainder) * (crowdsaleInterface.investorsStockInfo(crowdsaleInterface.investorsAddress(i)))) / (200));
}


  }
}

//#LOOPVARS: i

contract AthCrowdsaleInterface { }

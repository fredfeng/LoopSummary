
pragma solidity ^0.5.10;



contract C {
  

  uint _fromDate;
uint _toDate;
DiscountPhase[] discountPhases;
uint i;

  function foo() public {
    
for(uint i = 0; i < discountPhases.length; i++){
require(_fromDate > discountPhases[i].toDate || _toDate < discountPhases[i].fromDate);
}


  }
}

//#LOOPVARS: i

contract DiscountPhase { }

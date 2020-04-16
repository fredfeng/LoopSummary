
pragma solidity ^0.5.10;



contract C {
  

  DiscountPhase[] discountPhases;
uint i;
uint256 _purchasedAmount;

  function foo() public {
    
for(uint i = 0; i < discountPhases.length; i++){
if (now >= discountPhases[i].fromDate && now <= discountPhases[i].toDate) {
return _purchasedAmount * discountPhases[i].percent / 100;
}

}


  }
}

//#LOOPVARS: i

contract DiscountPhase { }

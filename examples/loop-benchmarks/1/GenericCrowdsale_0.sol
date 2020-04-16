
pragma solidity ^0.5.10;



contract C {
  

  Discount[] discounts;
uint256[] discountEthers;
uint256 i;
uint256[] discountValues;

  function foo() public {
    
for(uint256 i = 0; i < discountEthers.length; i++){
discounts.push(Discount((discountEthers[i]) * (1 ether), discountValues[i]));
}


  }
}

//#LOOPVARS: i

contract Discount { }

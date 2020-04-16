
pragma solidity ^0.5.10;



contract C {
  

  uint256 _amount;
Discount[] discounts;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < discounts.length; i++){
if (_amount >= discounts[i].amount) {
return discounts[i].value;
}

}


  }
}

//#LOOPVARS: i

contract Discount { }

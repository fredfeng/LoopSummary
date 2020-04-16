
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 arrayLength;
uint256 amount;
DiscStruct[] discounts;

  function foo() public {
    
for(uint8 i = 0; i < arrayLength; i++){
if (i == arrayLength - 1) {
return discounts[arrayLength - 1].disc;
}

if (amount < discounts[i + 1].amount) {
return discounts[i].disc;
}

}


  }
}

//#LOOPVARS: i

contract DiscStruct { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 decimalNum;
uint[] amounts;
address[] addresses;
uint j;
uint256 totalAmount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && addresses[j] != 0x0);
amounts[j] = (amounts[j]) * (decimalNum);
totalAmount = (totalAmount) + (amounts[j]);
}


  }
}

//#LOOPVARS: j

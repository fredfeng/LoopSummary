
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
uint256 totalAmount;
uint[] amounts;
uint j;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(amounts[j] > 0 && isNonZeroAccount(addresses[j]) && isAvailableAccount(addresses[j]));
totalAmount = (totalAmount) + (amounts[j]);
}


  }
}

//#LOOPVARS: j

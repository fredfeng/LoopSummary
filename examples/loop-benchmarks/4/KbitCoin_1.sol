
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => bool) frozenAccount;
uint256[] amounts;
uint256 totalAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0);
require(addresses[i] != address(0));
require(!frozenAccount[addresses[i]]);
totalAmount = (totalAmount) + (amounts[i]);
}


  }
}

//#LOOPVARS: i

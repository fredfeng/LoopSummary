
pragma solidity ^0.5.10;



contract C {
  

  uint[] amounts;
address[] addresses;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != 0x0 && now > unlockUnixTime[addresses[i]]);
amounts[i] = (amounts[i]) * (1e8);
totalAmount = (totalAmount) + (amounts[i]);
}


  }
}

//#LOOPVARS: i
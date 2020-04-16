
pragma solidity ^0.5.10;



contract C {
  

  uint[] amounts;
address[] addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint256 totalAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(amounts[i] > 0 && addresses[i] != 0x0 && frozenAccount[addresses[i]] == false && now > unlockUnixTime[addresses[i]]);
amounts[i] = (amounts[i]) * (1e8);
totalAmount = SafeMath.add(totalAmount, amounts[i]);
}


  }
}

//#LOOPVARS: i

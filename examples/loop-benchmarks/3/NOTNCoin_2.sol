
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
uint j;
mapping(address => uint256) balanceOf;
uint256 amount;

  function foo() public {
    
for(uint j = 0; j < addresses.length; j++){
require(addresses[j] != 0x0 && frozenAccount[addresses[j]] == false && now > unlockUnixTime[addresses[j]]);
balanceOf[addresses[j]] = (balanceOf[addresses[j]]) + (amount);
Transfer(msg.sender, addresses[j], amount);
}


  }
}

//#LOOPVARS: j

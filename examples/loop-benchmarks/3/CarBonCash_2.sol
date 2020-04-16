
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint) balances;
uint256 amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != 0x0 && frozenAccount[addresses[i]] == false && now > unlockUnixTime[addresses[i]]);
balances[addresses[i]] = SafeMath.add(balances[addresses[i]], amount);
Transfer(msg.sender, addresses[i], amount);
}


  }
}

//#LOOPVARS: i

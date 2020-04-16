
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
uint q;
mapping(address => bool) frozenAccount;
mapping(address => uint256) unlockUnixTime;
mapping(address => uint) balances;
uint256 amount;

  function foo() public {
    
for(uint q = 0; q < addresses.length; q++){
require(addresses[q] != 0x0 && frozenAccount[addresses[q]] == false && now > unlockUnixTime[addresses[q]]);
balances[addresses[q]] = SafeMath.add(balances[addresses[q]], amount);
emit Transfer(msg.sender, addresses[q], amount);
}


  }
}

//#LOOPVARS: q

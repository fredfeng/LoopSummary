
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
bytes empty;
mapping(address => bool) frozenAccount;
mapping(address => uint) balances;
uint256 amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
require(addresses[i] != address(0));
require(!frozenAccount[addresses[i]]);
balances[addresses[i]] = (balances[addresses[i]]) + (amount);
emit Transfer(msg.sender, addresses[i], amount, empty);
}


  }
}

//#LOOPVARS: i

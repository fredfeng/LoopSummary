
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] addresses;
bytes empty;
uint256[] amounts;
uint i;

  function foo() public {
    
for(i = 0; i < addresses.length; i++){
balances[addresses[i]] = (balances[addresses[i]]) + (amounts[i]);
emit Transfer(msg.sender, addresses[i], amounts[i], empty);
}


  }
}

//#LOOPVARS: i

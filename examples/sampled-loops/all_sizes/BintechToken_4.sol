
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
uint i;
uint[] amounts;
mapping(address => uint) balances;

  function foo() public {
    
for(i = 0; i < addresses.length; i++){
balances[addresses[i]] = SafeMath.add(balances[addresses[i]], amounts[i]);
emit Transfer(msg.sender, addresses[i], amounts[i]);
}


  }
}

//#LOOPVARS: i

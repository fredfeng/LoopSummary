
pragma solidity ^0.5.10;



contract C {
  

  uint256[] values;
address owner;
address[] to;
uint256 i;
mapping(address => uint) balances;

  function foo() public {
    
for(uint256 i = 0; i < to.length; i++){
balances[owner] = (balances[owner]) - (values[i]);
balances[to[i]] = (balances[to[i]]) + (values[i]);
emit Transfer(owner, to[i], values[i]);
}


  }
}

//#LOOPVARS: i

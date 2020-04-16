
pragma solidity ^0.5.10;



contract C {
  

  address from;
address[] _owners;
mapping(address => uint256) balances;
uint256 i;
uint256[] _values;

  function foo() public {
    
for(uint256 i = 0; i < _owners.length; i++){
address to = _owners[i];
uint256 value = _values[i];
require(value <= balances[from]);
balances[to] = (balances[to]) + (value);
balances[from] = (balances[from]) - (value);
emit Transfer(from, to, value);
}


  }
}

//#LOOPVARS: i

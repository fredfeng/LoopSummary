
pragma solidity ^0.5.10;



contract C {
  

  uint[] _values;
address[] _addresses;
mapping(address => uint256) balances;
uint i;
uint buffer;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
balances[_addresses[i]] = (balances[_addresses[i]]) + (_values[i]);
buffer = (buffer) + (_values[i]);
emit Transfer(this, _addresses[i], _values[i]);
}


  }
}

//#LOOPVARS: i

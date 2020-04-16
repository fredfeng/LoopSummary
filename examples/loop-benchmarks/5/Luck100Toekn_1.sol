
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint i;
address[] _tos;
uint256[] _values;
uint256 all;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
require(_tos[i] != address(0));
require(_tos[i] != msg.sender);
all = (all) + (_values[i]);
balances[_tos[i]] = (balances[_tos[i]]) + (_values[i]);
emit Transfer(msg.sender, _tos[i], _values[i]);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 _value;
address[] _tos;
uint i;

  function foo() public {
    
for(uint i = 0; i < _tos.length; i++){
require(_tos[i] != address(0));
require(_tos[i] != msg.sender);
balances[_tos[i]] = (balances[_tos[i]]) + (_value);
emit Transfer(msg.sender, _tos[i], _value);
}


  }
}

//#LOOPVARS: i

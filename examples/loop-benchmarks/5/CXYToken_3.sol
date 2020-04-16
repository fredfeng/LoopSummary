
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 j;
uint256 len;
address[] _tos;
uint256[] _values;

  function foo() public {
    
for(uint256 j = 0; j < len; j = (j) + (1)){
address _to = _tos[j];
require(_to != address(0));
balances[_to] = (balances[_to]) + (_values[j]);
balances[msg.sender] = (balances[msg.sender]) - (_values[j]);
emit Transfer(msg.sender, _to, _values[j]);
}


  }
}

//#LOOPVARS: j

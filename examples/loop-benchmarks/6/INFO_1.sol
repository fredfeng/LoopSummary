
pragma solidity ^0.5.10;



contract C {
  

  uint[] _values;
mapping(address => uint256) balances;
address[] _receivers;
uint cnt;
uint i;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
address _to = _receivers[i];
uint _value = _values[i];
require(_to != address(0) && _value <= balances[msg.sender]);
balances[msg.sender] = (balances[msg.sender]) - (_values[i]);
balances[_to] = (balances[_to]) + (_values[i]);
emit Transfer(msg.sender, _to, _values[i]);
}


  }
}

//#LOOPVARS: i

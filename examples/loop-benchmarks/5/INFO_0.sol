
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] _receivers;
uint _value;
uint cnt;
uint i;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
address _to = _receivers[i];
require(_to != address(0) && _value <= balances[msg.sender]);
balances[msg.sender] = (balances[msg.sender]) - (_value);
balances[_to] = (balances[_to]) + (_value);
emit Transfer(msg.sender, _to, _value);
}


  }
}

//#LOOPVARS: i

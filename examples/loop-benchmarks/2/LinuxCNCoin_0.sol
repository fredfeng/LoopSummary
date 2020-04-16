
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
address[] _receivers;
uint i;
uint _count;
uint256 _value;

  function foo() public {
    
for(uint i = 0; i < _count; i++){
balances[_receivers[i]] = (balances[_receivers[i]]) + (_value);
emit Transfer(msg.sender, _receivers[i], _value);
}


  }
}

//#LOOPVARS: i

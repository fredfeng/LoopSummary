
pragma solidity ^0.5.10;



contract C {
  

  address[] _receivers;
uint i;
mapping(address => uint) balances;
uint cnt;
uint256 _value;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
balances[_receivers[i]] = (balances[_receivers[i]]) + (_value);
emit Transfer(msg.sender, _receivers[i], _value);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
uint256[] _value;
uint i;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _to.length; i++){
_value[i] = SafeMath.mul(_value[i], 1 ether);
require(_value[i] <= balances[msg.sender]);
require(_to[i] != address(0));
balances[msg.sender] = (balances[msg.sender]) - (_value[i]);
balances[_to[i]] = (balances[_to[i]]) + (_value[i]);
emit Transfer(msg.sender, _to[i], _value[i]);
}


  }
}

//#LOOPVARS: i

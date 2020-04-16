
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
uint[] _amount;
uint totalSupply;
mapping(address => uint) balances;
uint i;

  function foo() public {
    
for(uint i = 0; i < _to.length; i++){
require(_to[i] != 0x0);
require(_amount[i] != 0);
balances[_to[i]] = (balances[_to[i]]) + (_amount[i]);
totalSupply = (totalSupply) + (_amount[i]);
Transfer(0x0, _to[i], _amount[i]);
}


  }
}

//#LOOPVARS: i

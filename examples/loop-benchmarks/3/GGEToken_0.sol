
pragma solidity ^0.5.10;



contract C {
  

  address owner;
mapping(address => uint256) balances;
uint256 i;
address[] _addr;
uint256[] _value;

  function foo() public {
    
for(uint256 i = 0; i < _addr.length; i++){
balances[owner] = (balances[owner]) - (_value[i]);
balances[_addr[i]] = (balances[_addr[i]]) + (_value[i]);
emit Transfer(owner, _addr[i], _value[i]);
}


  }
}

//#LOOPVARS: i

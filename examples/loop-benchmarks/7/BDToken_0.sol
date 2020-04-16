
pragma solidity ^0.5.10;



contract C {
  

  uint[] _amounts;
address[] _addresses;
uint i;
mapping(address => uint) balances;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(_addresses[i] != address(0));
require(_amounts[i] > 0);
require(balances[msg.sender] >= _amounts[i]);
require(balances[_addresses[i]] + _amounts[i] >= balances[_addresses[i]]);
balances[msg.sender] = (balances[msg.sender]) - (_amounts[i]);
balances[_addresses[i]] = (balances[_addresses[i]]) + (_amounts[i]);
emit Transfer(msg.sender, _addresses[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i

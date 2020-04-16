
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256[] _amounts;
address[] _addresses;
uint j;

  function foo() public {
    
for(j = 0; j < _addresses.length; j++){
balances[msg.sender] = (balances[msg.sender]) - (_amounts[j]);
balances[_addresses[j]] = (balances[_addresses[j]]) + (_amounts[j]);
emit Transfer(msg.sender, _addresses[j], _amounts[j]);
}


  }
}

//#LOOPVARS: j

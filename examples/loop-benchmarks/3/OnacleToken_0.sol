
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 _amount;
address[] _addresses;
uint j;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
balances[msg.sender] = (balances[msg.sender]) - (_amount);
balances[_addresses[j]] = (balances[_addresses[j]]) + (_amount);
emit Transfer(msg.sender, _addresses[j], _amount);
}


  }
}

//#LOOPVARS: j

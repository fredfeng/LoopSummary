






contract C {
  

  

  address[] _addresses;
uint256 _amount;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
balances[msg.sender] = ((balances[msg.sender]) - (_amount));
balances[_addresses[j]] = ((balances[_addresses[j]]) + (_amount));

}


  }

  

}

//#LOOPVARS: j










contract C {
  

  

  uint256[] _amounts;
uint j;
address[] _addresses;
mapping(address => uint256) balances;

  function foo() public {
    
for(j = 0; j < _addresses.length; j++){
balances[_addresses[j]] = ((balances[_addresses[j]]) + (_amounts[j]));

}


  }

  

}

//#LOOPVARS: j



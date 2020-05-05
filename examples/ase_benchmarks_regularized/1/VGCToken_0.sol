






contract C {
  

  

  uint[] _values;
address[] _addresses;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i



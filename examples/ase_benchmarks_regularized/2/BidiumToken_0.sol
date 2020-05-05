






contract C {
  

  

  uint buffer;
mapping(address => uint256) balances;
uint256[] _values;
address[] _addresses;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_values[i]));
buffer = ((buffer) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i



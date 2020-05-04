






contract C {
  

  

  uint[] _values;
address[] _addresses;
uint addressCount;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint j = 0; j < addressCount; j++){
require(_addresses[j] != address(0));
balances[_addresses[j]] = ((balances[_addresses[j]]) + (_values[j]));

}


  }

  

}

//#LOOPVARS: j



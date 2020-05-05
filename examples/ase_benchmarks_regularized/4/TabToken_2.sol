






contract C {
  

  

  address[] _addresses;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
require(_addresses[i] != address(0));
require(_values[i] <= balances[this]);
balances[this] = ((balances[this]) - (_values[i]));
balances[_addresses[i]] = ((balances[_addresses[i]]) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i



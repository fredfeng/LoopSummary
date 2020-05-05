






contract C {
  

  

  address[] _addresses;
mapping(address => bool) frozenAccounts;
bool _value;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(_addresses[j] != 0x0);
frozenAccounts[_addresses[j]] = _value;

}


  }

  

}

//#LOOPVARS: j



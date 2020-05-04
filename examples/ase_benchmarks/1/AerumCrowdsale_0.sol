






contract C {
  

  

  bool _completed;
mapping(address => bool) KYCPassed;
address[] _addresses;

  function foo() public {
    
for(uint16 index = 0; index < _addresses.length; index++){
KYCPassed[_addresses[index]] = _completed;
}


  }

  

}

//#LOOPVARS: index



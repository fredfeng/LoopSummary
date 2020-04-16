
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) KYCPassed;
uint16 index;
bool _completed;
address[] _addresses;

  function foo() public {
    
for(uint16 index = 0; index < _addresses.length; index++){
KYCPassed[_addresses[index]] = _completed;
}


  }
}

//#LOOPVARS: index

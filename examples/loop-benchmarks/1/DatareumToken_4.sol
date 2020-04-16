
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) bountyAddresses;
address[] _addresses;
uint i;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
bountyAddresses[_addresses[i]] = false;
}


  }
}

//#LOOPVARS: i

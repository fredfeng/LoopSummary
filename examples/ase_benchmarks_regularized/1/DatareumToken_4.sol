






contract C {
  

  

  address[] _addresses;
mapping(address => bool) bountyAddresses;

  function foo() public {
    
for(uint i = 0; i < _addresses.length; i++){
bountyAddresses[_addresses[i]] = false;
}


  }

  

}

//#LOOPVARS: i



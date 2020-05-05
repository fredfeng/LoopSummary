






contract C {
  

  

  address[] _addrs;
mapping(address => bool) registeredAddress;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
registeredAddress[_addrs[i]] = false;

}


  }

  

}

//#LOOPVARS: i



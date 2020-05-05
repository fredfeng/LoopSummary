






contract C {
  

  

  address[] _addrs;
mapping(address => bool) registeredAddress;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
require(_addrs[i] != address(0));
registeredAddress[_addrs[i]] = true;

}


  }

  

}

//#LOOPVARS: i




pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) registeredAddress;
uint256 i;
address[] _addrs;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
registeredAddress[_addrs[i]] = false;
emit Unregistered(_addrs[i]);
}


  }
}

//#LOOPVARS: i

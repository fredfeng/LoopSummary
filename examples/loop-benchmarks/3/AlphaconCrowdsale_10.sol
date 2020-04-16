
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) registeredAddress;
uint256 i;
address[] _addrs;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
require(_addrs[i] != address(0));
registeredAddress[_addrs[i]] = true;
emit Registered(_addrs[i]);
}


  }
}

//#LOOPVARS: i

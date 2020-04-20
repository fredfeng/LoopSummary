
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) whitelist;
uint256 i;
bool status;
address[] listAddresses;

  function foo() public {
    
for(uint256 i = 0; i < listAddresses.length; i++){
whitelist[listAddresses[i]] = status;
}


  }
}

//#LOOPVARS: i

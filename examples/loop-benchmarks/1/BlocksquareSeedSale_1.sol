
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) canRecieveTokens;
address[] _addresses;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addresses.length; i++){
canRecieveTokens[_addresses[i]] = true;
}


  }
}

//#LOOPVARS: i

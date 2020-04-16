
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _recipients.length; i++){
require(_recipients[i] != address(0));
}


  }
}

//#LOOPVARS: i

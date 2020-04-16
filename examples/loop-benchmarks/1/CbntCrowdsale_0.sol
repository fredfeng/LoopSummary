
pragma solidity ^0.5.10;



contract C {
  

  address[] _operators;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _operators.length; i++){
addAddressToWhitelist(_operators[i]);
}


  }
}

//#LOOPVARS: i

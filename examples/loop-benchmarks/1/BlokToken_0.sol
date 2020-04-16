
pragma solidity ^0.5.10;



contract C {
  

  address[] tokenGrantees;
uint i;
address _grantee;

  function foo() public {
    
for(uint i = 0; i < tokenGrantees.length; i++){
require(tokenGrantees[i] != _grantee);
}


  }
}

//#LOOPVARS: i

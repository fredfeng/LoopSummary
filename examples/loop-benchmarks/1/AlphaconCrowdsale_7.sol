
pragma solidity ^0.5.10;



contract C {
  

  uint i;
uint128[] amounts;

  function foo() public {
    
for(uint i = 0; i + 1 < amounts.length; i++){
require(amounts[i] > amounts[i + 1]);
}


  }
}

//#LOOPVARS: i
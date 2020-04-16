
pragma solidity ^0.5.10;



contract C {
  

  address target;
mapping(address => TimeLock[]) allocations;
uint j;

  function foo() public {
    
for(uint j = 0; j < allocations[target].length; j++){
allocations[target][j].balance = 0;
}


  }
}

//#LOOPVARS: j

contract TimeLock { }

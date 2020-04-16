
pragma solidity ^0.5.10;



contract C {
  

  address sender;
mapping(address => TimeLock[]) allocations;
uint j;

  function foo() public {
    
for(uint j = 0; j < allocations[sender].length; j++){
if (allocations[sender][j].time < block.timestamp) {
allocations[sender][j].balance = 0;
}

}


  }
}

//#LOOPVARS: j

contract TimeLock { }


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => TimeLock[]) allocations;
uint256 alllock_sum;
uint j;
address sender;

  function foo() public {
    
for(uint j = 0; j < allocations[sender].length; j++){
if (allocations[sender][j].releaseTime >= block.timestamp) {
alllock_sum = (alllock_sum) + (allocations[sender][j].balance);
}

}


  }
}

//#LOOPVARS: j

contract TimeLock { }

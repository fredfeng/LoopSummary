
pragma solidity ^0.5.10;



contract C {
  

  uint256 total_lockamount;
uint j;
mapping(address => TimeLock[]) allocations;
uint256 total_unlockamount;
address sender;

  function foo() public {
    
for(uint j = 0; j < allocations[sender].length; j++){
if (allocations[sender][j].releaseTime < block.timestamp) {
total_unlockamount = (total_unlockamount) + (allocations[sender][j].balance);
allocations[sender][j].balance = 0;
} else {
total_lockamount = (total_lockamount) + (allocations[sender][j].balance);
}

}


  }
}

//#LOOPVARS: j

contract TimeLock { }

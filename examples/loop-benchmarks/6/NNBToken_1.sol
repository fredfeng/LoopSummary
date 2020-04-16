
pragma solidity ^0.5.10;



contract C {
  

  uint lockedTimes;
address target;
mapping(address => TimeLock[]) allocations;
uint256 lockedSupply;
uint unlockTime;
uint i;

  function foo() public {
    
for(uint i = 0; i < lockedTimes; i++){
if (i > 0) {
unlockTime = unlockTime + 30 days;
}

uint256 lockedValue = (lockedSupply) / (lockedTimes);
if (i == lockedTimes - 1) {
lockedValue = ((lockedSupply) / (lockedTimes)) + ((lockedSupply) % (lockedTimes));
}

allocations[target].push(TimeLock(unlockTime, lockedValue));
}


  }
}

//#LOOPVARS: i

contract TimeLock { }


pragma solidity ^0.5.10;



contract C {
  

  uint privatorForEcologyUnlockTimes;
uint256 lockedPrivatorForEcologyPartOneSupply;
uint256 lockedPrivatorForEcologyPartTwoSupply;
mapping(address => TimeLock[]) allocations;
address privatorEcology;
uint unlockTime;
uint i;

  function foo() public {
    
for(uint i = 0; i < privatorForEcologyUnlockTimes; i++){
if (i > 0) {
unlockTime = unlockTime + 30 days;
}

uint256 lockedValue = (lockedPrivatorForEcologyPartOneSupply) / (privatorForEcologyUnlockTimes);
if (i == privatorForEcologyUnlockTimes - 1) {
lockedValue = ((lockedPrivatorForEcologyPartOneSupply) / (privatorForEcologyUnlockTimes)) + ((lockedPrivatorForEcologyPartOneSupply) % (privatorForEcologyUnlockTimes));
}

if (i < 6) {
uint256 partTwoValue = (lockedPrivatorForEcologyPartTwoSupply) / (6);
if (i == 5) {
partTwoValue = ((lockedPrivatorForEcologyPartTwoSupply) / (6)) + ((lockedPrivatorForEcologyPartTwoSupply) % (6));
}

lockedValue = (lockedValue) + (partTwoValue);
}

allocations[privatorEcology].push(TimeLock(unlockTime, lockedValue));
}


  }
}

//#LOOPVARS: i

contract TimeLock { }

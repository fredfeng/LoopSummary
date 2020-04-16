
pragma solidity ^0.5.10;



contract C {
  

  uint UNLOCK_TEN_PERCENT_PERIOD;
balance b;
uint unlockCount;
address _owner;
uint i;

  function foo() public {
    
for(uint i = b.unlockIndex; i < b.lockUpCount; i++){
lockup l = b.lockUpData[i];
if (l.unlockTimestamp <= now) {
uint count = unlockCount(l.unlockTimestamp, l.unlockCount);
uint256 unlockedAmount = ((l.amount) * (count)) / (10);
if (unlockedAmount > b.lockedUp) {
unlockedAmount = b.lockedUp;
l.unlockCount = 10;
} else {
b.available = (b.available) + (unlockedAmount);
b.lockedUp = (b.lockedUp) - (unlockedAmount);
l.unlockCount += count;
}

emit TokenUnlocked(_owner, unlockedAmount);
if (l.unlockCount == 10) {
lockup tempA = b.lockUpData[i];
lockup tempB = b.lockUpData[b.unlockIndex];
b.lockUpData[i] = tempB;
b.lockUpData[b.unlockIndex] = tempA;
b.unlockIndex += 1;
} else {
l.unlockTimestamp += UNLOCK_TEN_PERCENT_PERIOD * count;
}

}

}


  }
}

//#LOOPVARS: i

contract balance { }

contract lockup { }

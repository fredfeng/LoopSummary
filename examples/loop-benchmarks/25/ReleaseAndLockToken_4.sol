
pragma solidity ^0.5.10;



contract C {
  

  address frozenAddr;
uint256 j;
address _target;
mapping(address => uint256) preReleaseAmounts;
ILockedStorage lockedStorage;
uint256 timeRecLen;
bool released;
uint256 nowTime;

  function foo() public {
    
for(uint256 j = 0; j < timeRecLen; released = false){
uint256 endTime = lockedStorage.endTimeOfStage(frozenAddr, j);
uint256 releasedEndTime = lockedStorage.releaseEndTimeOfStage(frozenAddr, j);
uint256 amount = lockedStorage.amountOfStage(frozenAddr, j);
uint256 remain = lockedStorage.remainOfStage(frozenAddr, j);
if (nowTime > endTime && endTime > 0 && releasedEndTime > endTime) {
uint256 lastReleased = (amount) - (remain);
uint256 value = ((amount * (nowTime) - (endTime) / (releasedEndTime) - (endTime))) - (lastReleased);
if (value > remain) {
value = remain;
}

lockedStorage.decreaseRemainLockedOf(frozenAddr, j, value);
emit ReleaseFunds(_target, value);
preReleaseAmounts[frozenAddr] = (preReleaseAmounts[frozenAddr]) + (value);
if (lockedStorage.remainOfStage(frozenAddr, j) < 1e8) {
if (!lockedStorage.removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = (timeRecLen) - (1);
}

} else if (nowTime >= endTime && endTime > 0 && releasedEndTime == endTime) {
lockedStorage.decreaseRemainLockedOf(frozenAddr, j, remain);
emit ReleaseFunds(frozenAddr, amount);
preReleaseAmounts[frozenAddr] = (preReleaseAmounts[frozenAddr]) + (amount);
if (!lockedStorage.removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = (timeRecLen) - (1);
}


if (!released) {
j = (j) + (1);
}

}


  }
}

//#LOOPVARS: j

contract ILockedStorage { }

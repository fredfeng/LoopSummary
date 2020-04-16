
pragma solidity ^0.5.10;



contract C {
  

  address frozenAddr;
uint256 j;
mapping(address => uint256) preReleaseAmounts;
mapping(address => TimeRec[]) frozenTimes;
uint256 timeRecLen;
bool released;
uint256 nowTime;

  function foo() public {
    
for(uint256 j = 0; j < timeRecLen; released = false){
TimeRec timePair = frozenTimes[frozenAddr][j];
if (nowTime > timePair.endTime && timePair.endTime > 0 && timePair.releasePeriodEndTime > timePair.endTime) {
uint256 lastReleased = (timePair.amount) - (timePair.remain);
uint256 value = ((timePair.amount * (nowTime) - (timePair.endTime) / (timePair.releasePeriodEndTime) - (timePair.endTime))) - (lastReleased);
if (value > timePair.remain) {
value = timePair.remain;
}

timePair.remain = (timePair.remain) - (value);
ReleaseFunds(frozenAddr, value);
preReleaseAmounts[frozenAddr] = (preReleaseAmounts[frozenAddr]) + (value);
if (timePair.remain < 1e8) {
if (!removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = (timeRecLen) - (1);
}

} else if (nowTime >= timePair.endTime && timePair.endTime > 0 && timePair.releasePeriodEndTime == timePair.endTime) {
timePair.remain = 0;
ReleaseFunds(frozenAddr, timePair.amount);
preReleaseAmounts[frozenAddr] = (preReleaseAmounts[frozenAddr]) + (timePair.amount);
if (!removeLockedTime(frozenAddr, j)) {
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

contract TimeRec { }

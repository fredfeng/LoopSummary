
pragma solidity ^0.5.10;



contract C {
  

  address frozenAddr;
uint256 j;
mapping(address => TimeRec[]) frozenTimes;
uint256 timeRecLen;
bool released;
mapping(address => uint256) preReleaseAmounts;

  function foo() public {
    
for(uint256 j = 0; j < timeRecLen; released = false){
TimeRec timePair = frozenTimes[frozenAddr][j];
uint256 nowTime = now;
if (nowTime > timePair.endTime && timePair.endTime > 0 && timePair.duration > 0) {
uint256 value = timePair.amount * (nowTime - timePair.endTime) / timePair.duration;
if (value > timePair.remain) {
value = timePair.remain;
}

timePair.endTime = nowTime;
timePair.remain = (timePair.remain) - (value);
if (timePair.remain < 1e8) {
if (!removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = (timeRecLen) - (1);
}

ReleaseFunds(frozenAddr, value);
preReleaseAmounts[frozenAddr] = (preReleaseAmounts[frozenAddr]) + (value);
} else if (nowTime >= timePair.endTime && timePair.endTime > 0 && timePair.duration == 0) {
if (!removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = (timeRecLen) - (1);
ReleaseFunds(frozenAddr, timePair.amount);
preReleaseAmounts[frozenAddr] = (preReleaseAmounts[frozenAddr]) + (timePair.amount);
}


if (!released) {
j = (j) + (1);
}

}


  }
}

//#LOOPVARS: j

contract TimeRec { }

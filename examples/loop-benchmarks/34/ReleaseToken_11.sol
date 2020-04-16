
pragma solidity ^0.5.10;



contract C {
  

  address _target;
uint256 len;
uint256 i;
address _dest;
mapping(address => TimeRec[]) frozenTimes;
itoken owned;
address[] frozenAccounts;
mapping(address => uint256) preReleaseAmounts;

  function foo() public {
    
while(i < len){
address frozenAddr = frozenAccounts[i];
if (frozenAddr == _target) {
uint256 timeRecLen = frozenTimes[frozenAddr].length;
bool released = false;
for (uint256 j = 0; j < timeRecLen; released = false) {
TimeRec timePair = frozenTimes[frozenAddr][j];
uint256 nowTime = now;
if (nowTime > timePair.endTime && timePair.endTime > 0 && timePair.duration > 0) {
uint256 value = timePair.amount * (nowTime - timePair.endTime) / timePair.duration;
if (value > timePair.remain) {
value = timePair.remain;
}

timePair.endTime = nowTime;
timePair.remain = timePair.remain.sub(value);
if (timePair.remain < 1e8) {
if (!removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = timeRecLen.sub(1);
}

ReleaseFunds(frozenAddr, value);
preReleaseAmounts[frozenAddr] = preReleaseAmounts[frozenAddr].add(value);
} else if (nowTime >= timePair.endTime && timePair.endTime > 0 && timePair.duration == 0) {
if (!removeLockedTime(frozenAddr, j)) {
return false;
}

released = true;
timeRecLen = timeRecLen.sub(1);
ReleaseFunds(frozenAddr, timePair.amount);
preReleaseAmounts[frozenAddr] = preReleaseAmounts[frozenAddr].add(timePair.amount);
}


if (!released) {
j = j.add(1);
}

}

if (preReleaseAmounts[frozenAddr] > 0) {
owned.freezeAccount(frozenAddr, false);
if (!owned.transferFrom(_target, _dest, preReleaseAmounts[frozenAddr])) {
return false;
}

}

if (frozenTimes[frozenAddr].length == 0) {
if (!removeAccount(i)) {
return false;
}

} else {
owned.freezeAccount(frozenAddr, true);
}

return true;
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract itoken { }

contract TimeRec { }

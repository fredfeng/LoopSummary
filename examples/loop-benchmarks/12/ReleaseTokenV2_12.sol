
pragma solidity ^0.5.10;



contract C {
  

  address _target;
uint256 len;
uint256 i;
mapping(address => TimeRec[]) frozenTimes;
address[] frozenAccounts;

  function foo() public {
    
while(i < len){
address frozenAddr = frozenAccounts[i];
if (frozenAddr == _target) {
uint256 timeRecLen = frozenTimes[frozenAddr].length;
uint256 j = 0;
while(j < timeRecLen) {
TimeRec timePair = frozenTimes[frozenAddr][j];
if (_oldEndTime == timePair.endTime) {
uint256 duration = timePair.releasePeriodEndTime.sub(timePair.endTime);
timePair.endTime = _newEndTime;
timePair.releasePeriodEndTime = timePair.endTime.add(duration);
return true;
}

j = j.add(1);
}

return false;
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }

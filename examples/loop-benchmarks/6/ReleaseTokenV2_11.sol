
pragma solidity ^0.5.10;



contract C {
  

  address frozenAddr;
uint256 j;
uint256 _oldEndTime;
mapping(address => TimeRec[]) frozenTimes;
uint256 timeRecLen;
uint256 _newEndTime;

  function foo() public {
    
while(j < timeRecLen){
TimeRec timePair = frozenTimes[frozenAddr][j];
if (_oldEndTime == timePair.endTime) {
uint256 duration = (timePair.releasePeriodEndTime) - (timePair.endTime);
timePair.endTime = _newEndTime;
timePair.releasePeriodEndTime = (timePair.endTime) + (duration);
return true;
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }


pragma solidity ^0.5.10;



contract C {
  

  address frozenAddr;
uint256 j;
uint256 _duration;
uint256 _origEndTime;
mapping(address => TimeRec[]) frozenTimes;
uint256 timeRecLen;

  function foo() public {
    
while(j < timeRecLen){
TimeRec timePair = frozenTimes[frozenAddr][j];
if (_origEndTime == timePair.endTime) {
timePair.releasePeriodEndTime = (_origEndTime) + (_duration);
return true;
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }

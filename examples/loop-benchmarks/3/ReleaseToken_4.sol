
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
mapping(address => TimeRec[]) frozenTimes;
address frozenAddr;
uint256 timeRecLen;

  function foo() public {
    
while(j < timeRecLen){
TimeRec timePair = frozenTimes[frozenAddr][j];
if (now >= timePair.endTime) {
return true;
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }


pragma solidity ^0.5.10;



contract C {
  

  address[] frozenAccounts;
mapping(address => TimeRec[]) frozenTimes;
uint256 len;
uint256 i;

  function foo() public {
    
while(i < len){
address frozenAddr = frozenAccounts[i];
uint256 timeRecLen = frozenTimes[frozenAddr].length;
uint256 j = 0;
while(j < timeRecLen) {
TimeRec timePair = frozenTimes[frozenAddr][j];
if (now >= timePair.endTime) {
return true;
}

j = j.add(1);
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }


pragma solidity ^0.5.10;



contract C {
  

  TimeRec[] lockedTimes;
uint256 i;

  function foo() public {
    
while(i < (lockedTimes.length) - (1)){
lockedTimes[i] = lockedTimes[(i) + (1)];
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }

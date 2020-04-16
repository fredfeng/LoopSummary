
pragma solidity ^0.5.10;



contract C {
  

  uint timestamp;
uint8[] monthDayCounts;
uint DAY_IN_SECONDS;
uint8 month;
uint16 i;

  function foo() public {
    
for(i = 1; i < month; i++){
timestamp += DAY_IN_SECONDS * monthDayCounts[i - 1];
}


  }
}

//#LOOPVARS: i

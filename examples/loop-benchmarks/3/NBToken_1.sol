
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint timestamp;
MyDateTime dt;
uint secondsAccountedFor;
uint DAY_IN_SECONDS;

  function foo() public {
    
for(i = 1; i <= getDaysInMonth(dt.month, dt.year); i++){
if (DAY_IN_SECONDS + secondsAccountedFor > timestamp) {
dt.day = i;
break;
}

secondsAccountedFor += DAY_IN_SECONDS;
}


  }
}

//#LOOPVARS: i

contract MyDateTime { }

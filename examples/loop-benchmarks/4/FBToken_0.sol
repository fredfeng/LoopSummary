
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint timestamp;
MyDateTime dt;
uint secondsInMonth;
uint secondsAccountedFor;
uint DAY_IN_SECONDS;

  function foo() public {
    
for(i = 1; i <= 12; i++){
secondsInMonth = DAY_IN_SECONDS * getDaysInMonth(i, dt.year);
if (secondsInMonth + secondsAccountedFor > timestamp) {
dt.month = i;
break;
}

secondsAccountedFor += secondsInMonth;
}


  }
}

//#LOOPVARS: i

contract MyDateTime { }

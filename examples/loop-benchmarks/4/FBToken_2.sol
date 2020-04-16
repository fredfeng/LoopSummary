
pragma solidity ^0.5.10;



contract C {
  

  uint timestamp;
uint YEAR_IN_SECONDS;
uint secondsAccountedFor;
uint LEAP_YEAR_IN_SECONDS;
uint16 year;

  function foo() public {
    
while(secondsAccountedFor > timestamp){
if (isLeapYear(uint16(year - 1))) {
secondsAccountedFor -= LEAP_YEAR_IN_SECONDS;
} else {
secondsAccountedFor -= YEAR_IN_SECONDS;
}

year -= 1;
}

  }
}

//#LOOPVARS: 

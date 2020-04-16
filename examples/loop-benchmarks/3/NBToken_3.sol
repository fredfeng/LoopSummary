
pragma solidity ^0.5.10;



contract C {
  

  uint timestamp;
uint16 ORIGIN_YEAR;
uint YEAR_IN_SECONDS;
uint LEAP_YEAR_IN_SECONDS;
uint16 year;
uint16 i;

  function foo() public {
    
for(i = ORIGIN_YEAR; i < year; i++){
if (isLeapYear(i)) {
timestamp += LEAP_YEAR_IN_SECONDS;
} else {
timestamp += YEAR_IN_SECONDS;
}

}


  }
}

//#LOOPVARS: i

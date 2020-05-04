






contract C {
  

  

  uint16 i;
uint timestamp;
uint8[] monthDayCounts;
uint DAY_IN_SECONDS;
uint8 month;

  function foo() public {
    
for(i = 1; i < month; i++){
timestamp += DAY_IN_SECONDS * monthDayCounts[i - 1];
}


  }

  

}

//#LOOPVARS: i



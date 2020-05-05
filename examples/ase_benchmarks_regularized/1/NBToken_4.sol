






contract C {
  

  

  uint16 i;
uint8 month;
uint timestamp;
uint DAY_IN_SECONDS;
uint8[] monthDayCounts;

  function foo() public {
    
for(uint i = 1; i < month; i++){
timestamp += DAY_IN_SECONDS * monthDayCounts[i - 1];
}


  }

  

}

//#LOOPVARS: i



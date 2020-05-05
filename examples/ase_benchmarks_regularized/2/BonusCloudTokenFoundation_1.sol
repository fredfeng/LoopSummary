






contract C {
  

  

  uint[] vestingPercents;
uint percent;
uint[] vestingCommencementDates;

  function foo() public {
    
for(uint32 i = 0; i < vestingCommencementDates.length; i++){
if (block.timestamp < vestingCommencementDates[i]) {
} else {
percent += vestingPercents[i];
}

}


  }

  

}

//#LOOPVARS: i



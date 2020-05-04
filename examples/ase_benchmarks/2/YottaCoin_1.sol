






contract C {
  

  

  uint8[] percents;
uint256[] periods;

  function foo() public {
    
for(uint256 i = 1; i < periods.length; i = ((i) + (1))){
require(periods[((i) - (1))] < periods[i]);
require(percents[((i) - (1))] <= percents[i]);
}


  }

  

}

//#LOOPVARS: i



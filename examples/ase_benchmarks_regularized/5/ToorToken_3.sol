






contract C {
  

  

  uint256 rateWindow;
uint256 intervals;
uint256 ratMultiplier;
uint256 intPerBatch;
uint256 tokensHeld;
mapping(uint256 => uint256) ratByYear;

  function foo() public {
    
while(intervals > 0){
if (intervals >= intPerBatch) {
tokensHeld = (((tokensHeld) * (ratByYear[rateWindow] ** intPerBatch))) / (ratMultiplier ** intPerBatch);
intervals = ((intervals) - (intPerBatch));
} else {
tokensHeld = (((tokensHeld) * (ratByYear[rateWindow] ** intervals))) / (ratMultiplier ** intervals);
intervals = 0;
}

}

  }

  

}

//#LOOPVARS: i



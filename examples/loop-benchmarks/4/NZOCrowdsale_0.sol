
pragma solidity ^0.5.10;



contract C {
  

  uint256 limitWeekOther;
uint256 _weiAmount;
uint numberWeeks;
uint256 amountOfTokens;
uint j;
uint256 rate;
uint currentPeriod;
uint256 tokenAllocated;
uint256 limitWeekZero;

  function foo() public {
    
for(uint j = 0; j < numberWeeks; j++){
if (currentPeriod == (j + 1)) {
amountOfTokens = ((_weiAmount) * (rate)) / (5 + j * 25);
if ((tokenAllocated) + (amountOfTokens) > limitWeekZero + (limitWeekOther) * (j + 1)) {
emit TokenLimitReached(tokenAllocated, amountOfTokens);
return 0;
}

}

}


  }
}

//#LOOPVARS: j

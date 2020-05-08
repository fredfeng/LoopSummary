






contract C {
  

  

  uint256 weiAmount;
uint curRound;
uint256[] roundGoals;
uint256[] roundRates;
uint256 weiRaisedIntermediate;
uint256 roundWei;
uint256 calculatedTokenAmount;

  function foo() public {
    
for(curRound; curRound < 5; curRound++){
if (((weiRaisedIntermediate) + (weiAmount)) > roundGoals[curRound]) {
roundWei = ((roundGoals[curRound]) - (weiRaisedIntermediate));
weiRaisedIntermediate = ((weiRaisedIntermediate) + (roundWei));
weiAmount = ((weiAmount) - (roundWei));
calculatedTokenAmount = ((calculatedTokenAmount) + (((roundWei) * (roundRates[curRound]))));
} else {
calculatedTokenAmount = ((calculatedTokenAmount) + (((weiAmount) * (roundRates[curRound]))));
break;
}

}


  }

  

}

//#LOOPVARS: i



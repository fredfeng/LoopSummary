






contract C {
  

  

  uint curRound;
uint256[] roundGoals;
uint256 tokenAmount;
uint256[] roundRates;
uint256 calculatedWeiAmount;
uint256 weiRaisedIntermediate;
uint256 roundWei;

  function foo() public {
    
for(curRound; curRound < 5; curRound++){
if (((weiRaisedIntermediate) + (((tokenAmount) / (roundRates[curRound])))) > roundGoals[curRound]) {
roundWei = ((roundGoals[curRound]) - (weiRaisedIntermediate));
weiRaisedIntermediate = ((weiRaisedIntermediate) + (roundWei));
tokenAmount = ((tokenAmount) - (((roundWei) / (roundRates[curRound]))));
calculatedWeiAmount = ((calculatedWeiAmount) + (((tokenAmount) / (roundRates[curRound]))));
} else {
calculatedWeiAmount = ((calculatedWeiAmount) + (((tokenAmount) / (roundRates[curRound]))));
break;
}

}


  }

  

}

//#LOOPVARS: i



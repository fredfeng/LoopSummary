






contract C {
  

  

  uint256 uncountedWeiAmount;
uint256[] crowdsaleRates;
uint256 tokenAmount;
uint256[] crowdsaleWeiAvailableLevels;
uint256 uncountedWeiRaised;

  function foo() public {
    
for(uint i = 0; i < crowdsaleWeiAvailableLevels.length; i++){
uint256 weiAvailable = crowdsaleWeiAvailableLevels[i];
if (uncountedWeiRaised >= weiAvailable) {
uncountedWeiRaised = ((uncountedWeiRaised) - (weiAvailable));
} else {
if (uncountedWeiRaised > 0) {
weiAvailable = ((weiAvailable) - (uncountedWeiRaised));
uncountedWeiRaised = 0;
}

if (uncountedWeiAmount <= weiAvailable) {
tokenAmount = ((tokenAmount) + (((uncountedWeiAmount) * (crowdsaleRates[i]))));
break;
} else {
uncountedWeiAmount = ((uncountedWeiAmount) - (weiAvailable));
tokenAmount = ((tokenAmount) + (((weiAvailable) * (crowdsaleRates[i]))));
}

}

}


  }

  

}

//#LOOPVARS: i



pragma solidity ^0.5.10;



contract C {
  

  uint256 uncountedWeiRaised;
uint256[] crowdsaleRates;
uint256 tokenAmount;
uint256[] crowdsaleWeiAvailableLevels;
uint i;
uint256 uncountedWeiAmount;

  function foo() public {
    
for(uint i = 0; i < crowdsaleWeiAvailableLevels.length; i++){
uint256 weiAvailable = crowdsaleWeiAvailableLevels[i];
if (uncountedWeiRaised >= weiAvailable) {
uncountedWeiRaised = (uncountedWeiRaised) - (weiAvailable);
} else {
if (uncountedWeiRaised > 0) {
weiAvailable = (weiAvailable) - (uncountedWeiRaised);
uncountedWeiRaised = 0;
}

if (uncountedWeiAmount <= weiAvailable) {
tokenAmount = (tokenAmount) + ((uncountedWeiAmount) * (crowdsaleRates[i]));
break;
} else {
uncountedWeiAmount = (uncountedWeiAmount) - (weiAvailable);
tokenAmount = (tokenAmount) + ((weiAvailable) * (crowdsaleRates[i]));
}

}

}


  }
}

//#LOOPVARS: i

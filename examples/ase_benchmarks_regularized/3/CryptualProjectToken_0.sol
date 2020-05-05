






contract C {
  

  

  uint256 currentCap;
uint256 currentMinElapsedTime;
uint256[] crowdsaleUserCaps;
uint256 elapsedTime;
uint256[] crowdsaleMinElapsedTimeLevels;

  function foo() public {
    
for(uint i = 0; i < crowdsaleUserCaps.length; i++){
if (elapsedTime < crowdsaleMinElapsedTimeLevels[i]) continue;

if (crowdsaleMinElapsedTimeLevels[i] < currentMinElapsedTime) continue;

currentCap = crowdsaleUserCaps[i];
}


  }

  

}

//#LOOPVARS: i



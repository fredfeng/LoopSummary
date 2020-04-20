
pragma solidity ^0.5.10;



contract C {
  

  uint256 currentMinElapsedTime;
uint256[] crowdsaleMinElapsedTimeLevels;
uint256 currentCap;
uint256 elapsedTime;
uint256[] crowdsaleUserCaps;
uint i;

  function foo() public {
    
for(uint i = 0; i < crowdsaleUserCaps.length; i++){
if (elapsedTime < crowdsaleMinElapsedTimeLevels[i]) continue;

if (crowdsaleMinElapsedTimeLevels[i] < currentMinElapsedTime) continue;

currentCap = crowdsaleUserCaps[i];
}


  }
}

//#LOOPVARS: i

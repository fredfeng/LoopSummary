
pragma solidity ^0.5.10;



contract C {
  

  uint256[] miningRate;
uint currentMintable;
uint currentYear;
uint256 rewardAmount;
uint i;

  function foo() public {
    
for(uint i = 0; i < currentYear; i++){
currentMintable = (currentMintable) + (((rewardAmount) * (miningRate[i])) / (100));
}


  }
}

//#LOOPVARS: i

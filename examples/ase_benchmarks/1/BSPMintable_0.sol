






contract C {
  

  

  uint currentYear;
uint currentMintable;
uint256[] miningRate;
uint256 rewardAmount;

  function foo() public {
    
for(uint i = 0; i < currentYear; i++){
currentMintable = ((currentMintable) + (((((rewardAmount) * (miningRate[i]))) / (100))));
}


  }

  

}

//#LOOPVARS: i



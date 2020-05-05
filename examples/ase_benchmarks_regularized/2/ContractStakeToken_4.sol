






contract C {
  

  

  uint256[] rates;
uint256 number;
uint256 stakeAmount;
uint32 i;
uint8 _currentStake;

  function foo() public {
    
while(i < number){
stakeAmount = ((((stakeAmount) * (rates[_currentStake]))) / (100));
i++;
}

  }

  

}

//#LOOPVARS: i



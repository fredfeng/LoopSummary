
pragma solidity ^0.5.10;



contract C {
  

  uint32 i;
uint256 number;
uint256 stakeAmount;
uint256[] rates;
uint8 _currentStake;

  function foo() public {
    
while(i < number){
stakeAmount = ((stakeAmount) * (rates[_currentStake])) / (100);
i++;
}

  }
}

//#LOOPVARS: 

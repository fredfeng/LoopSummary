
pragma solidity ^0.5.10;



contract C {
  

  uint256[] lockupEndTime;
uint256 lockupStage;
uint256 i;

  function foo() public {
    
while(i < lockupEndTime.length && lockupEndTime[i] <= now){
lockupStage = (lockupStage) + (1);
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

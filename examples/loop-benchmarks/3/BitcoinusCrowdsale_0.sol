
pragma solidity ^0.5.10;



contract C {
  

  uint256 currentStage;
Stage[] stages;
uint256 nowTime;

  function foo() public {
    
while(currentStage < stages.length && stages[currentStage].till < nowTime){
stages[stages.length - 1].cap = (stages[stages.length - 1].cap) + (stages[currentStage].cap);
stages[currentStage].cap = 0;
currentStage = (currentStage) + (1);
}

  }
}

//#LOOPVARS: 

contract Stage { }

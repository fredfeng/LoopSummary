
pragma solidity ^0.5.10;



contract C {
  

  uint256 currentTime;
uint256 stageCount;
Stage[] stages;
uint8 nextStage;
uint8 curStage;

  function foo() public {
    
while(nextStage < stageCount && stages[nextStage].startDate <= currentTime){
stages[nextStage].cap = (stages[nextStage].cap) + (stages[curStage].cap);
curStage = nextStage;
nextStage = nextStage + 1;
}

  }
}

//#LOOPVARS: 

contract Stage { }

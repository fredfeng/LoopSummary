
pragma solidity ^0.5.10;



contract C {
  

  Stage p;
Stage[] stages;
uint8 currentStage;

  function foo() public {
    
for(currentStage = 0; currentStage < stages.length; currentStage++){
p = stages[currentStage];
if (p.startTime <= now && now <= p.endTime) {
return;
}

}


  }
}

//#LOOPVARS: currentStage

contract Stage { }

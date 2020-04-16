
pragma solidity ^0.5.10;



contract C {
  

  uint prevTimeLimit;
Milestone[] milestones;
uint i;

  function foo() public {
    
for(uint i = 0; i < milestones.length; i++){
Milestone milestone = milestones[i];
prevTimeLimit += milestone.periodInDays * 1 days;
if (now < prevTimeLimit) return milestone.bonus;

}


  }
}

//#LOOPVARS: i

contract Milestone { }

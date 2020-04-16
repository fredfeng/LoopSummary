
pragma solidity ^0.5.10;



contract C {
  

  Milestone[] milestones;
uint last;
uint i;

  function foo() public {
    
for(uint i = 0; i < milestones.length; i++){
Milestone milestone = milestones[i];
last += milestone.periodInDays * 1 days;
}


  }
}

//#LOOPVARS: i

contract Milestone { }

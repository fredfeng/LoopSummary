
pragma solidity ^0.5.10;



contract C {
  

  uint winningVoteWeight;
uint _winningProject;
uint p;
Project[] projects;

  function foo() public {
    
for(uint p = 0; p < projects.length; p++){
if (projects[p].votesWeight > winningVoteWeight && projects[p].active == true) {
winningVoteWeight = projects[p].votesWeight;
_winningProject = projects[p].id;
}

}


  }
}

//#LOOPVARS: p

contract Project { }

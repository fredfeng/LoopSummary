
pragma solidity ^0.5.10;



contract C {
  

  uint cnt;
Proposal proposal;

  function foo() public {
    
for(uint cnt = 0; cnt <= proposal.numOfChoices; cnt++){
delete proposal.votes[cnt];
}


  }
}

//#LOOPVARS: cnt

contract Proposal { }

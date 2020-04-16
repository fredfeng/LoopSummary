
pragma solidity ^0.5.10;



contract C {
  

  uint precReq;
uint totalReputation;
bytes32 _proposalId;
Proposal proposal;
uint cnt;

  function foo() public {
    
for(uint cnt = 0; cnt <= proposal.numOfChoices; cnt++){
if (proposal.votes[cnt] > totalReputation * precReq / 100) {
Proposal tmpProposal = proposal;
deleteProposal(_proposalId);
emit ExecuteProposal(_proposalId, tmpProposal.avatar, cnt, totalReputation);
(tmpProposal.executable).execute(_proposalId, tmpProposal.avatar, int(cnt));
return true;
}

}


  }
}

//#LOOPVARS: cnt

contract Proposal { }

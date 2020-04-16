
pragma solidity ^0.5.10;



contract C {
  

  Parameters params;
address[] _voters;
bytes32 _proposalId;
Proposal proposal;
uint i;

  function foo() public {
    
for(uint i = 0; i < _voters.length; i++){
Voter voter = proposal.voters[_voters[i]];
if (voter.reputation > 0) {
uint rep = params.reputationSystem.reputationOf(_voters[i]);
if (rep > voter.reputation) {
proposal.votes[voter.vote] = (proposal.votes[voter.vote]) + (rep - voter.reputation);
proposal.totalVotes = ((proposal.totalVotes)) + (rep - voter.reputation);
} else if (rep < voter.reputation) {
proposal.votes[voter.vote] = (proposal.votes[voter.vote]) - (voter.reputation - rep);
proposal.totalVotes = ((proposal.totalVotes)) - (voter.reputation - rep);
}


if (rep != voter.reputation) {
voter.reputation = rep;
emit RefreshReputation(_proposalId, proposal.avatar, _voters[i], rep);
}

}

}


  }
}

//#LOOPVARS: i

contract Voter { }

contract Proposal { }

contract Parameters { }


pragma solidity ^0.5.10;



contract C {
  

  uint[] _pollIDs;
uint[] _numsTokens;
uint[] _prevPollIDs;
bytes32[] _secretHashes;
uint i;

  function foo() public {
    
for(uint i = 0; i < _pollIDs.length; i++){
commitVote(_pollIDs[i], _secretHashes[i], _numsTokens[i], _prevPollIDs[i]);
}


  }
}

//#LOOPVARS: i

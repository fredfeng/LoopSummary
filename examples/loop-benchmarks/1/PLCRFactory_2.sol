
pragma solidity ^0.5.10;



contract C {
  

  uint[] _voteOptions;
uint[] _pollIDs;
uint i;
uint[] _salts;

  function foo() public {
    
for(uint i = 0; i < _pollIDs.length; i++){
revealVote(_pollIDs[i], _voteOptions[i], _salts[i]);
}


  }
}

//#LOOPVARS: i

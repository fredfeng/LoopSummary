
pragma solidity ^0.5.10;



contract C {
  

  uint[] _pollIDs;
uint i;

  function foo() public {
    
for(uint i = 0; i < _pollIDs.length; i++){
rescueTokens(_pollIDs[i]);
}


  }
}

//#LOOPVARS: i

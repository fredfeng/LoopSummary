
pragma solidity ^0.5.10;



contract C {
  

  uint len;
uint i;
uint[] _releaseTimes;
uint[] _releaseRatios;

  function foo() public {
    
for(i = 0; i < len - 1; i++){
require(_releaseTimes[i] < _releaseTimes[i + 1]);
require(_releaseRatios[i] < _releaseRatios[i + 1]);
}


  }
}

//#LOOPVARS: i

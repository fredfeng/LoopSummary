
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
uint32[] _odds;

  function foo() public {
    
for(uint256 j = 0; j < (_odds.length) - (1); j++){
require(_odds[j] < _odds[j + 1]);
}


  }
}

//#LOOPVARS: j

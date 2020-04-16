
pragma solidity ^0.5.10;



contract C {
  

  uint256 _removeIdx;
uint i;
uint256[] self;

  function foo() public {
    
for(uint i = _removeIdx; i < self.length - 1; i++){
self[i] = self[i + 1];
}


  }
}

//#LOOPVARS: i

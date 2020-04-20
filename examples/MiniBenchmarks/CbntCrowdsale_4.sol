
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _steps;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i + 1 < _steps.length; i++){
require(_steps[i] > _steps[i + 1]);
}


  }
}

//#LOOPVARS: i

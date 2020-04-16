
pragma solidity ^0.5.10;



contract C {
  

  address[] _targets;
uint256 res;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _targets.length; i = (i) + (1)){
require(_targets[i] != address(0));
res = (res) + (gatherOldBalanceOf(_targets[i]));
}


  }
}

//#LOOPVARS: i

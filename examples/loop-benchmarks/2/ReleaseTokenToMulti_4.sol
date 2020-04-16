
pragma solidity ^0.5.10;



contract C {
  

  iReleaseTokenContract iReleaseContract;
address[] _targets;
bool res;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _targets.length; i = (i) + (1)){
require(_targets[i] != address(0));
res = iReleaseContract.releaseOldBalanceOf(_targets[i]) && res;
}


  }
}

//#LOOPVARS: i

contract iReleaseTokenContract { }


pragma solidity ^0.5.10;



contract C {
  

  address[] _dests;
uint256 i;
address[] _targets;
bool res;
iReleaseTokenContract iReleaseContract;

  function foo() public {
    
while(i < _targets.length){
require(_targets[i] != address(0));
require(_dests[i] != address(0));
res = iReleaseContract.releaseWithStage(_targets[i], _dests[i]) || res;
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract iReleaseTokenContract { }

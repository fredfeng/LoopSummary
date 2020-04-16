
pragma solidity ^0.5.10;



contract C {
  

  iReleaseTokenContract iReleaseContract;
address[] _targets;
bool res;
uint256 i;

  function foo() public {
    
while(i < _targets.length){
res = iReleaseContract.releaseAccount(_targets[i]) || res;
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract iReleaseTokenContract { }

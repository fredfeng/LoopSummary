
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _frozenEndTimes;
uint256 i;
uint256[] _releasePeriods;
address[] _targets;
bool res;
iReleaseTokenContract iReleaseContract;
uint256[] _values;

  function foo() public {
    
for(uint256 i = 0; i < _targets.length; i = (i) + (1)){
require(_targets[i] != address(0));
res = iReleaseContract.freeze(_targets[i], _values[i], _frozenEndTimes[i], _releasePeriods[i]) && res;
}


  }
}

//#LOOPVARS: i

contract iReleaseTokenContract { }

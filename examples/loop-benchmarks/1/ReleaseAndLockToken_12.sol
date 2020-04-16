
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _frozenEndTimes;
bytes32[] _names;
uint256 i;
uint256[] _releasePeriods;
address[] _targets;
bool res;
uint256[] _values;

  function foo() public {
    
for(uint256 i = 0; i < _targets.length; i = (i) + (1)){
res = freeze(_targets[i], bytes32ToString(_names[i]), _values[i], _frozenEndTimes[i], _releasePeriods[i]) && res;
}


  }
}

//#LOOPVARS: i

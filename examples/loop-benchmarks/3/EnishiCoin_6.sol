
pragma solidity ^0.5.10;



contract C {
  

  uint[] _unixTimes;
address[] _targets;
uint i;
mapping(address => uint256) unlockUnixTime;

  function foo() public {
    
for(uint i = 0; i < _targets.length; i++){
require(unlockUnixTime[_targets[i]] < _unixTimes[i]);
unlockUnixTime[_targets[i]] = _unixTimes[i];
LockedFunds(_targets[i], _unixTimes[i]);
}


  }
}

//#LOOPVARS: i

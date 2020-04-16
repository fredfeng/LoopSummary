
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) unlockUnixTime;
address[] _targets;
uint[] _unixTimes;
uint j;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
require(_targets[j] != Ownable.owner);
require(unlockUnixTime[_targets[j]] < _unixTimes[j]);
unlockUnixTime[_targets[j]] = _unixTimes[j];
emit LockedAccount(_targets[j], _unixTimes[j]);
}


  }
}

//#LOOPVARS: j

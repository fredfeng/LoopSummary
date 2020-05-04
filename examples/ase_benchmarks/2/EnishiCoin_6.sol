






contract C {
  

  

  mapping(address => uint256) unlockUnixTime;
address[] _targets;
uint[] _unixTimes;

  function foo() public {
    
for(uint i = 0; i < _targets.length; i++){
require(unlockUnixTime[_targets[i]] < _unixTimes[i]);
unlockUnixTime[_targets[i]] = _unixTimes[i];

}


  }

  

}

//#LOOPVARS: i



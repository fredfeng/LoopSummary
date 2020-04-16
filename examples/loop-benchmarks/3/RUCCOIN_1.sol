
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
uint[] unixTimes;
mapping(address => uint256) unlockUnixTime;
uint j;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(unlockUnixTime[targets[j]] < unixTimes[j]);
unlockUnixTime[targets[j]] = unixTimes[j];
emit LockedFunds(targets[j], unixTimes[j]);
}


  }
}

//#LOOPVARS: j

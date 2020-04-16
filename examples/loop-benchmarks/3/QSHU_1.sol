
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
uint[] unixTimes;
uint q;
mapping(address => uint256) unlockUnixTime;

  function foo() public {
    
for(uint q = 0; q < targets.length; q++){
require(unlockUnixTime[targets[q]] < unixTimes[q]);
unlockUnixTime[targets[q]] = unixTimes[q];
emit LockedFunds(targets[q], unixTimes[q]);
}


  }
}

//#LOOPVARS: q

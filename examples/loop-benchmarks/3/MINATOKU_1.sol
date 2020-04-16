
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
uint[] unixTimes;
uint i;
mapping(address => uint256) unlockUnixTime;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
require(unlockUnixTime[targets[i]] < unixTimes[i]);
unlockUnixTime[targets[i]] = unixTimes[i];
LockedFunds(targets[i], unixTimes[i]);
}


  }
}

//#LOOPVARS: i

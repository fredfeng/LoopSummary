






contract C {
  

  

  mapping(address => uint256) unlockUnixTime;
address[] targets;
uint[] unixTimes;

  function foo() public {
    
for(uint q = 0; q < targets.length; q++){
require(unlockUnixTime[targets[q]] < unixTimes[q]);
unlockUnixTime[targets[q]] = unixTimes[q];

}


  }

  

}

//#LOOPVARS: q



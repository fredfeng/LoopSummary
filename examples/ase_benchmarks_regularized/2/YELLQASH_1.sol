






contract C {
  

  

  mapping(address => uint256) unlockUnixTime;
address[] targets;
uint[] unixTimes;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(unlockUnixTime[targets[j]] < unixTimes[j]);
unlockUnixTime[targets[j]] = unixTimes[j];

}


  }

  

}

//#LOOPVARS: j



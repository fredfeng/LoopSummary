






contract C {
  

  

  mapping(address => uint256) unlockUnixTime;
address[] targets;
uint[] unixTimes;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
require(unlockUnixTime[targets[i]] < unixTimes[i]);
unlockUnixTime[targets[i]] = unixTimes[i];

}


  }

  

}

//#LOOPVARS: i



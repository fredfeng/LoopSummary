






contract C {
  

  

  address[] targets;
uint[] unixTimes;
mapping(address => uint256) unlockUnixTime;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(unlockUnixTime[targets[j]] < unixTimes[j]);
unlockUnixTime[targets[j]] = unixTimes[j];

}


  }

  

}

//#LOOPVARS: j



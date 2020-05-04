






contract C {
  

  

  mapping(address => uint256) unlockUnixTime;
address[] _targets;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
unlockUnixTime[_targets[j]] = 0;

}


  }

  

}

//#LOOPVARS: j



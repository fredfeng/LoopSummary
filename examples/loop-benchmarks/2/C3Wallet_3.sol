
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) unlockUnixTime;
address[] _targets;
uint j;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
unlockUnixTime[_targets[j]] = 0;
emit UnlockedAccount(_targets[j]);
}


  }
}

//#LOOPVARS: j

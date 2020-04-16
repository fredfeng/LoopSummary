
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
mapping(address => uint256) lockups;
uint256 _lockupTimeUntil;
uint j;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(targets[j] != 0x0);
lockups[targets[j]] = _lockupTimeUntil;
emit Lockup(targets[j], _lockupTimeUntil);
}


  }
}

//#LOOPVARS: j

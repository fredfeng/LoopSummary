






contract C {
  

  

  mapping(address => uint256) lockups;
address[] targets;
uint256 _lockupTimeUntil;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(targets[j] != 0x0);
lockups[targets[j]] = _lockupTimeUntil;

}


  }

  

}

//#LOOPVARS: j










contract C {
  

  

  mapping(address => bool) frozenAccount;
address[] targets;
bool isFrozen;

  function foo() public {
    
for(uint q = 0; q < targets.length; q++){
require(targets[q] != 0x0);
frozenAccount[targets[q]] = isFrozen;

}


  }

  

}

//#LOOPVARS: q



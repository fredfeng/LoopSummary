






contract C {
  

  

  mapping(address => bool) frozenAccount;
bool isFrozen;
address[] targets;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(targets[j] != 0x0);
frozenAccount[targets[j]] = isFrozen;

}


  }

  

}

//#LOOPVARS: j



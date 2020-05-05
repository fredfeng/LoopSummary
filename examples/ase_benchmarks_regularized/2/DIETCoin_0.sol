






contract C {
  

  

  address[] targets;
bool isFrozen;
mapping(address => bool) frozenAccount;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(targets[j] != 0x0);
frozenAccount[targets[j]] = isFrozen;

}


  }

  

}

//#LOOPVARS: j



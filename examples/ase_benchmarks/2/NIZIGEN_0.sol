






contract C {
  

  

  mapping(address => bool) frozenAccount;
address[] targets;
bool isFrozen;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
require(targets[i] != 0x0);
frozenAccount[targets[i]] = isFrozen;

}


  }

  

}

//#LOOPVARS: i



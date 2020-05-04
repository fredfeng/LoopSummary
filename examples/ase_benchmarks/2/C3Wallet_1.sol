






contract C {
  

  

  mapping(address => bool) frozenAccount;
address[] _targets;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
require(_targets[j] != 0x0 && _targets[j] != Ownable.owner);
frozenAccount[_targets[j]] = false;

}


  }

  

}

//#LOOPVARS: j










contract C {
  

  

  mapping(address => bool) frozenAccount;
bool _isFrozen;
address[] _targets;

  function foo() public {
    
for(uint i = 0; i < _targets.length; i++){
require(_targets[i] != 0x0);
frozenAccount[_targets[i]] = _isFrozen;

}


  }

  

}

//#LOOPVARS: i



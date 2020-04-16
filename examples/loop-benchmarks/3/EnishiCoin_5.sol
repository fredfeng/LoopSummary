
pragma solidity ^0.5.10;



contract C {
  

  bool _isFrozen;
address[] _targets;
mapping(address => bool) frozenAccount;
uint i;

  function foo() public {
    
for(uint i = 0; i < _targets.length; i++){
require(_targets[i] != 0x0);
frozenAccount[_targets[i]] = _isFrozen;
FrozenFunds(_targets[i], _isFrozen);
}


  }
}

//#LOOPVARS: i

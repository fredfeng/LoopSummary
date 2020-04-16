
pragma solidity ^0.5.10;



contract C {
  

  address[] _targets;
mapping(address => bool) frozenAccount;
uint j;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
require(_targets[j] != 0x0 && _targets[j] != Ownable.owner);
frozenAccount[_targets[j]] = true;
emit FrozenAccount(_targets[j]);
}


  }
}

//#LOOPVARS: j

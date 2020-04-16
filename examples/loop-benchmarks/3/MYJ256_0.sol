
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
bool isFrozen;
mapping(address => bool) frozenAccount;
uint j;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(targets[j] != 0x0);
frozenAccount[targets[j]] = isFrozen;
FrozenFunds(targets[j], isFrozen);
}


  }
}

//#LOOPVARS: j


pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
uint q;
mapping(address => bool) frozenAccount;
bool isFrozen;

  function foo() public {
    
for(uint q = 0; q < targets.length; q++){
require(targets[q] != 0x0);
frozenAccount[targets[q]] = isFrozen;
emit FrozenFunds(targets[q], isFrozen);
}


  }
}

//#LOOPVARS: q

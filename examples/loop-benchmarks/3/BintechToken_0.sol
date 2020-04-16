
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
bool isFrozen;
mapping(address => bool) frozenAccount;
uint i;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
require(targets[i] != 0x0);
frozenAccount[targets[i]] = isFrozen;
emit FrozenFunds(targets[i], isFrozen);
}


  }
}

//#LOOPVARS: i

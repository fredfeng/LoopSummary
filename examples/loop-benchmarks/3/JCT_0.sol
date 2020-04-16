
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
bool isFrozen;
mapping(address => bool) frozenAccount;
uint j;

  function foo() public {
    
for(uint j = 0; j < targets.length; j++){
require(isNonZeroAccount(targets[j]));
frozenAccount[targets[j]] = isFrozen;
emit FrozenFunds(targets[j], isFrozen);
}


  }
}

//#LOOPVARS: j

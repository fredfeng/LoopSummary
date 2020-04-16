
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balanceOf;
address[] _targets;
mapping(address => bool) frozenAccount;
uint j;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
require(_targets[j] != 0x0);
frozenAccount[_targets[j]] = true;
Freeze(_targets[j], balanceOf[_targets[j]]);
}


  }
}

//#LOOPVARS: j


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) frozenAccount;
uint256 i;
uint256 len;
address[] _targets;
bool[] _freezes;

  function foo() public {
    
for(uint256 i = 0; i < len; i = (i) + (1)){
address _target = _targets[i];
require(_target != address(0));
bool _freeze = _freezes[i];
frozenAccount[_target] = _freeze;
}


  }
}

//#LOOPVARS: i

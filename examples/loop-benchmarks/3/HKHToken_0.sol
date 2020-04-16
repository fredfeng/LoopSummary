
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
uint256 len;
address[] _targets;
mapping(address => uint256) frozenAccount;
uint _timestamp;

  function foo() public {
    
for(uint256 i = 0; i < len; i = (i) + (1)){
address _target = _targets[i];
require(_target != address(0));
frozenAccount[_target] = _timestamp;
}


  }
}

//#LOOPVARS: i

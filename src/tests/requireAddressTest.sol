
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
uint256 len;
address[] _targets;
mapping(address => uint256) frozenAccount;
uint _timestamp;

  function foo() public {
    
for(uint256 i = 0; i < len; i = (i) + (1)){
require(_targets[i] != address(0));
frozenAccount[_targets[i]] = _timestamp;
}


  }
}

//#LOOPVARS: i

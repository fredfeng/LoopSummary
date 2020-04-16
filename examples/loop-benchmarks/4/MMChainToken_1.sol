
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _multiAmount;
uint256 _target;
uint256 i;
address[] _multiAddr;

  function foo() public {
    
for(uint256 i = 0; i < _multiAddr.length; i++){
address owner = _multiAddr[i];
uint256 value = _multiAmount[i];
_target = (_target) + (value);
mintTokens(owner, value);
}


  }
}

//#LOOPVARS: i

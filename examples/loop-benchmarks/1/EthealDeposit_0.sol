
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
bool _state;
address[] _addr;

  function foo() public {
    
for(uint256 i = 0; i < _addr.length; i++){
setWhitelist(_addr[i], _state);
}


  }
}

//#LOOPVARS: i

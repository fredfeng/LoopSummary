
pragma solidity ^0.5.10;



contract C {
  

  uint i;
address[] _addr;

  function foo() public {
    
for(uint i = 0; i < _addr.length; i++){
_lock(_addr[i]);
}


  }
}

//#LOOPVARS: i

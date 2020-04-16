
pragma solidity ^0.5.10;



contract C {
  

  address[] _lockAddress;
uint i;

  function foo() public {
    
for(uint i = 0; i < _lockAddress.length; i++){
unlock(_lockAddress[i]);
}


  }
}

//#LOOPVARS: i

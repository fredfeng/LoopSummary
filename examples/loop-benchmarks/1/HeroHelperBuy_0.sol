
pragma solidity ^0.5.10;



contract C {
  

  bytes _b;
uint i;
uint256 number;

  function foo() public {
    
for(uint i = 0; i < _b.length; i++){
number = number + uint(_b[i]) * (2 ** (8 * (_b.length - (i + 1))));
}


  }
}

//#LOOPVARS: i

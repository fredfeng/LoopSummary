
pragma solidity ^0.5.10;



contract C {
  

  bytes b;
uint i;
bytes32 out;

  function foo() public {
    
for(uint i = 0; i < b.length; i++){
out |= bytes32(b[i] & 0xFF) >> (i) * (8);
}


  }
}

//#LOOPVARS: i

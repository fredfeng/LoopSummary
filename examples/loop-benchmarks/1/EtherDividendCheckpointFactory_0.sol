
pragma solidity ^0.5.10;



contract C {
  

  bytes4 sig;
uint len;
bytes _data;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
sig = bytes4(uint(sig) + uint(_data[i]) * (2 ** (8 * (len - 1 - i))));
}


  }
}

//#LOOPVARS: i

contract bytes4 { }

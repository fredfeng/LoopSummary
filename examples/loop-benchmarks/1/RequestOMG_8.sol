
pragma solidity ^0.5.10;



contract C {
  

  uint8 size;
bytes data;
uint j;
bytes bytesString;
uint _offset;

  function foo() public {
    
for(uint j = 0; j < size; j++){
bytesString[j] = data[_offset + j];
}


  }
}

//#LOOPVARS: j

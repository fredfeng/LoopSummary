
pragma solidity ^0.5.10;



contract C {
  

  bytes32 x;
uint8 charCount;
uint j;
bytes bytesString;

  function foo() public {
    
for(uint j = 0; j < 32; j++){
uint8 value = uint8(x[j]) % 24;
byte char = byte(65 + value);
bytesString[charCount] = char;
charCount++;
}


  }
}

//#LOOPVARS: j

contract byte { }

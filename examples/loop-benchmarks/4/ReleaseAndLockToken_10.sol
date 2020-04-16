
pragma solidity ^0.5.10;



contract C {
  

  uint charCount;
bytes bytesString;
uint j;
bytes32 _b32;

  function foo() public {
    
for(uint j = 0; j < 32; j++){
byte char = byte(bytes32(uint(_b32) * 2 ** (8 * j)));
if (char != 0) {
bytesString[charCount] = char;
charCount++;
}

}


  }
}

//#LOOPVARS: j

contract byte { }

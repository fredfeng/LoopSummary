






contract C {
  

  

  uint j;
bytes32 x;
uint[] bytesString;
uint charCount;

  function foo() public {
    
for(j = 0; j < 32; j++){
byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
if (char != 0) {
bytesString[charCount] = char;
charCount++;
}

}


  }

  

}

//#LOOPVARS: j



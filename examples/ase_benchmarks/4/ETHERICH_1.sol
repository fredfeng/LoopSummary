






contract C {
  

  

  bytes32 x;
uint[] bytesString;
uint8 charCount;

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



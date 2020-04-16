
pragma solidity ^0.5.10;



contract C {
  

  uint charCount;
bytes bytesString;
uint j;
bytes bytesStringTrimmed;

  function foo() public {
    
for(j = 0; j < charCount; j++){
bytesStringTrimmed[j] = bytesString[j];
}


  }
}

//#LOOPVARS: j

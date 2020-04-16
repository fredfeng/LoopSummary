
pragma solidity ^0.5.10;



contract C {
  

  uint result;
uint mul;
uint i;
bytes source;

  function foo() public {
    
for(uint i = 20; i > 0; i--){
result += uint8(source[i - 1]) * mul;
mul = mul * 256;
}


  }
}

//#LOOPVARS: i

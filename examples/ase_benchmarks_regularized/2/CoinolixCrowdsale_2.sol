






contract C {
  

  

  uint[] source;
uint result;
uint mul;

  function foo() public {
    
for(uint i = 20; i > 0; i--){
result += uint8(source[i - 1]) * mul;
mul = mul * 256;
}


  }

  

}

//#LOOPVARS: i



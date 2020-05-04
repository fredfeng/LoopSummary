






contract C {
  

  

  uint[] str;
bytes32 sig;

  function foo() public {
    
for(uint8 i = 0; i < 32; ++i){
str[2 * i] = byte((uint8(sig[i]) / 16 < 10 ? 48, 87) + uint8(sig[i]) / 16);
str[2 * i + 1] = byte((uint8(sig[i]) % 16 < 10 ? 48, 87) + (uint8(sig[i]) % 16));
}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  uint256 factor;
uint256 referer_address;
uint[] data;

  function foo() public {
    
for(uint i = 20; i > 0; i--){
referer_address += uint8(data[i - 1]) * factor;
factor = factor * 256;
}


  }

  

}

//#LOOPVARS: i



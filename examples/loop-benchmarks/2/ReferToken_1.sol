
pragma solidity ^0.5.10;



contract C {
  

  bytes data;
uint256 referer_address;
uint256 factor;
uint i;

  function foo() public {
    
for(uint i = 20; i > 0; i--){
referer_address += uint8(data[i - 1]) * factor;
factor = factor * 256;
}


  }
}

//#LOOPVARS: i

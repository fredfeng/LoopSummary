
pragma solidity ^0.5.10;



contract C {
  

  Pixel[] pixels;
uint256 i;
uint256[] result;

  function foo() public {
    
for(uint256 i = 0; i < 16384; i++){
result[i] = pixels[i].times;
}


  }
}

//#LOOPVARS: i

contract Pixel { }

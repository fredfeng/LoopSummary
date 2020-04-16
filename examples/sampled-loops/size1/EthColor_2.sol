
pragma solidity ^0.5.10;



contract C {
  

  address[] result;
uint256 i;
Pixel[] pixels;

  function foo() public {
    
for(uint256 i = 0; i < 16384; i++){
result[i] = pixels[i].owner;
}


  }
}

//#LOOPVARS: i

contract Pixel { }


pragma solidity ^0.5.10;



contract C {
  

  uint32 restPoints;
uint256 _seed;
uint32 i;
uint16[] arr;
uint index;

  function foo() public {
    
while(i < restPoints){
uint8 positionz = uint8((_seed / (10 ** index)) % 5);
arr[positionz] = (arr[positionz]) + (1);
i = (i) + (1);
index = (index) + (1);
}

  }
}

//#LOOPVARS: 

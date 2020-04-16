
pragma solidity ^0.5.10;



contract C {
  

  uint256 _seed;
uint32 i;
uint32 mainPoints;
uint16[] arr;
uint8[] mainStats;
uint index;

  function foo() public {
    
while(i < mainPoints){
uint8 position = uint8((_seed / (10 ** index)) % 10);
if (position < 5) {
position = 0;
} else {
position = 1;
}

arr[mainStats[position]] = (arr[mainStats[position]]) + (1);
i = (i) + (1);
index = (index) + (1);
}

  }
}

//#LOOPVARS: 

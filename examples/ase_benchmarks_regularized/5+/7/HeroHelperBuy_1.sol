






contract C {
  

  

  uint index;
uint16[] arr;
uint32 mainPoints;
uint32 i;
uint256 _seed;
uint8[] mainStats;

  function foo() public {
    
while(i < mainPoints){
uint8 position = uint8((_seed / (10 ** index)) % 10);
if (position < 5) {
position = 0;
} else {
position = 1;
}

arr[mainStats[position]] = ((arr[mainStats[position]]) + (1));
i = ((i) + (1));
index = ((index) + (1));
}

  }

  

}

//#LOOPVARS: i



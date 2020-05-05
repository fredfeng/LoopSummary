






contract C {
  

  

  uint index;
uint16[] arr;
uint32 i;
uint256 _seed;
uint32 restPoints;

  function foo() public {
    
while(i < restPoints){
uint8 positionz = uint8((_seed / (10 ** index)) % 5);
arr[positionz] = ((arr[positionz]) + (1));
i = ((i) + (1));
index = ((index) + (1));
}

  }

  

}

//#LOOPVARS: i



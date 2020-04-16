
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address _rec;
address[] recsLookUpTable;
uint8 maxRecsAmount;

  function foo() public {
    
for(uint8 i = 0; i < maxRecsAmount; i++){
if (recsLookUpTable[i] == address(0)) {
recsLookUpTable[i] = _rec;
break;
}

}


  }
}

//#LOOPVARS: i

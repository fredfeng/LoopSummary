
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 rnd;
mapping(uint32 => uint32) warriorChestProbability;
uint256 tempDist;

  function foo() public {
    
for(uint8 i = 0; i < 6; i++){
tempDist += warriorChestProbability[i];
if (rnd <= tempDist) {
return i;
}

}


  }
}

//#LOOPVARS: i

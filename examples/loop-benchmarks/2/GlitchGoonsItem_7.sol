
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint32 => uint32) gladiatorChestProbability;
uint256 rnd;
uint256 tempDist;

  function foo() public {
    
for(uint8 i = 0; i < 6; i++){
tempDist += gladiatorChestProbability[i];
if (rnd <= tempDist) {
return i;
}

}


  }
}

//#LOOPVARS: i

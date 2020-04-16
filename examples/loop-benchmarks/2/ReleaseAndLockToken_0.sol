
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
address frozenAddr;
ILockedStorage lockedStorage;
uint256 timeRecLen;

  function foo() public {
    
while(j < timeRecLen){
if (now >= lockedStorage.endTimeOfStage(frozenAddr, j)) {
return true;
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

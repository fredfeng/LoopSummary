
pragma solidity ^0.5.10;



contract C {
  

  ILockedStorage lockedStorage;
uint256 len;
uint256 i;

  function foo() public {
    
while(i < len){
address frozenAddr = lockedStorage.addressByIndex(i);
uint256 timeRecLen = lockedStorage.lockedStagesNum(frozenAddr);
uint256 j = 0;
while(j < timeRecLen) {
if (now >= lockedStorage.endTimeOfStage(frozenAddr, j)) {
return true;
}

j = j.add(1);
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

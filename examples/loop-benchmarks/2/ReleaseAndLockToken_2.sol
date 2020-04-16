
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
ILockedStorage lockedStorage;
address _target;
uint256 timeRecLen;

  function foo() public {
    
while(j < timeRecLen){
if (now >= lockedStorage.endTimeOfStage(_target, j)) {
return true;
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

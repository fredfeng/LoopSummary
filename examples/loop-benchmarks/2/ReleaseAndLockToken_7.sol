
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
address _account;
ILockedStorage lockedStorage;
uint256 timeRecLen;
uint256 totalRemain;

  function foo() public {
    
while(j < timeRecLen){
totalRemain = totalRemain.add(lockedStorage.remainOfStage(_account, j));
j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

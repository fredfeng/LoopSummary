
pragma solidity ^0.5.10;



contract C {
  

  uint256[] newLockTime;
uint256 j;
uint256 i;
uint256[] trimLockTime;
uint256[] newLockValue;
uint256[] trimLockValue;

  function foo() public {
    
while(i < j){
trimLockTime[i] = newLockTime[i];
trimLockValue[i] = newLockValue[i];
i++;
}

  }
}

//#LOOPVARS: 

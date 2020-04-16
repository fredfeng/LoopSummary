
pragma solidity ^0.5.10;



contract C {
  

  ILockedStorage lockedStorage;
uint256 len;
address _tk;
uint256 i;

  function foo() public {
    
while(i < len){
address target = lockedStorage.addressByIndex(i);
if (lockedStorage.lockedStagesNum(target) == 1 && lockedStorage.endTimeOfStage(target, 0) == lockedStorage.releaseEndTimeOfStage(target, 0) && lockedStorage.endTimeOfStage(target, 0) > 0 && now >= lockedStorage.endTimeOfStage(target, 0)) {
uint256 releasedAmount = lockedStorage.amountOfStage(target, 0);
if (!lockedStorage.removeLockedTime(target, 0)) {
return false;
}

if (!lockedStorage.removeAccount(target)) {
return false;
}

releaseTokens(target, _tk, releasedAmount);
emit ReleaseFunds(target, releasedAmount);
len = (len) - (1);
} else {
i = (i) + (1);
}

}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

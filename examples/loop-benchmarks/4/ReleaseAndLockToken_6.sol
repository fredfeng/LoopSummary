
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
uint256 _origDuration;
address _target;
uint256 _newDuration;
uint256 _origEndTime;
ILockedStorage lockedStorage;
uint256 timeRecLen;

  function foo() public {
    
while(j < timeRecLen){
uint256 endTime = lockedStorage.endTimeOfStage(_target, j);
uint256 releasedEndTime = lockedStorage.releaseEndTimeOfStage(_target, j);
if (_origEndTime == endTime && _origDuration == (releasedEndTime) - (endTime)) {
return lockedStorage.setNewReleaseEndTime(_target, j, (_origEndTime) + (_newDuration));
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

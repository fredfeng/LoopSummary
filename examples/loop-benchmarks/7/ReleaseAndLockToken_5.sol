
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
uint256 _oldEndTime;
address _target;
ILockedStorage lockedStorage;
uint256 _oldDuration;
uint256 timeRecLen;
uint256 _newEndTime;

  function foo() public {
    
while(j < timeRecLen){
uint256 endTime = lockedStorage.endTimeOfStage(_target, j);
uint256 releasedEndTime = lockedStorage.releaseEndTimeOfStage(_target, j);
uint256 duration = (releasedEndTime) - (endTime);
if (_oldEndTime == endTime && _oldDuration == duration) {
bool res = lockedStorage.changeEndTime(_target, j, _newEndTime);
res = lockedStorage.setNewReleaseEndTime(_target, j, (_newEndTime) + (duration)) && res;
return res;
}

j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract ILockedStorage { }

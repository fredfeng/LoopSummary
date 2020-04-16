
pragma solidity ^0.5.10;



contract C {
  

  uint256 idx;
mapping(address => LockupInfo[]) lockupInfo;
mapping(address => bool) locks;
address _holder;

  function foo() public {
    
for(uint256 idx = 0; idx < lockupInfo[_holder].length; idx++){
if (locks[_holder] == false) {
return true;
}

if (lockupInfo[_holder][idx].releaseTime <= now) {
if (releaseTimeLock(_holder, idx)) {
idx -= 1;
}

}

}


  }
}

//#LOOPVARS: idx

contract LockupInfo { }

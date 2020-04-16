
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) locks;
uint256 releaseAmount;
address _holder;
mapping(address => LockupInfo) lockupInfo;

  function foo() public {
    
for(lockupInfo[_holder].releaseTime <= now; ){
if (lockupInfo[_holder].lockupBalance <= lockupInfo[_holder].unlockAmountPerRound) {
releaseAmount = (releaseAmount) + (lockupInfo[_holder].lockupBalance);
delete lockupInfo[_holder];
locks[_holder] = false;
break;
} else {
releaseAmount = (releaseAmount) + (lockupInfo[_holder].unlockAmountPerRound);
lockupInfo[_holder].lockupBalance = (lockupInfo[_holder].lockupBalance) - (lockupInfo[_holder].unlockAmountPerRound);
lockupInfo[_holder].releaseTime = (lockupInfo[_holder].releaseTime) + (lockupInfo[_holder].termOfRound);
}

}


  }
}

//#LOOPVARS: 

contract LockupInfo { }

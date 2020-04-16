
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => TokenLockVault) tokenLocks;
address _beneficiary;
uint256 totalTokensLocked;
address allowanceProvider;
OMIToken token;
uint256 crowdsaleEndTime;
uint256 i;
TokenLockVault lock;
bool hasUnDueLocks;

  function foo() public {
    
for(uint256 i = 0; i < lock.locks.length; i++){
Lock currentLock = lock.locks[i];
if (currentLock.released || currentLock.revoked) {
continue;
}

if ((crowdsaleEndTime) + (currentLock.lockDuration) >= now) {
hasUnDueLocks = true;
continue;
}

require(currentLock.amount <= token.allowance(allowanceProvider, address(this)));
UnlockedTokens(_beneficiary, currentLock.amount);
tokenLocks[_beneficiary].locks[i].released = true;
tokenLocks[_beneficiary].tokenBalance = (tokenLocks[_beneficiary].tokenBalance) - (currentLock.amount);
totalTokensLocked = (totalTokensLocked) - (currentLock.amount);
assert(token.transferFrom(allowanceProvider, _beneficiary, currentLock.amount));
}


  }
}

//#LOOPVARS: i

contract TokenLockVault { }

contract Lock { }

contract OMIToken { }

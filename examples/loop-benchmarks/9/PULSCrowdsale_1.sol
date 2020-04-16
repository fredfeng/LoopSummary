
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => lockList) addressLocks;
mapping(address => uint256) balances;
address _addressToUnlock;
uint256 i;

  function foo() public {
    
while(i < addressLocks[_addressToUnlock].lockedTokens.length){
if (now > addressLocks[_addressToUnlock].lockedTokens[i].startTime + addressLocks[_addressToUnlock].lockedTokens[i].timeToLock) {
balances[_addressToUnlock] = (balances[_addressToUnlock]) + (addressLocks[_addressToUnlock].lockedTokens[i].amount);
emit TokenUnlocking(_addressToUnlock, addressLocks[_addressToUnlock].lockedTokens[i].amount);
if (i < addressLocks[_addressToUnlock].lockedTokens.length) {
for (uint256 j = i; j < addressLocks[_addressToUnlock].lockedTokens.length - 1; j++) {
addressLocks[_addressToUnlock].lockedTokens[j] = addressLocks[_addressToUnlock].lockedTokens[j + 1];
}

}

delete addressLocks[_addressToUnlock].lockedTokens[addressLocks[_addressToUnlock].lockedTokens.length - 1];
addressLocks[_addressToUnlock].lockedTokens.length = (addressLocks[_addressToUnlock].lockedTokens.length) - (1);
} else {
i = (i) + (1);
}

}

  }
}

//#LOOPVARS: 

contract lockList { }


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => lockList) addressLocks;
uint256 i;
uint256 j;
address _addressToUnlock;

  function foo() public {
    
for(uint256 j = i; j < addressLocks[_addressToUnlock].lockedTokens.length - 1; j++){
addressLocks[_addressToUnlock].lockedTokens[j] = addressLocks[_addressToUnlock].lockedTokens[j + 1];
}


  }
}

//#LOOPVARS: j

contract lockList { }

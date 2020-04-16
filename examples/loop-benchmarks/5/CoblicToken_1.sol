
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bytes32[]) lockReason;
address _of;
uint256 i;
mapping(address => mapping(bytes32 => lockToken)) locked;
uint256 lockedTokens;
uint256 unlockableTokens;

  function foo() public {
    
for(uint256 i = 0; i < lockReason[_of].length; i++){
lockedTokens = tokensUnlockable(_of, lockReason[_of][i]);
if (lockedTokens > 0) {
unlockableTokens = (unlockableTokens) + (lockedTokens);
locked[_of][lockReason[_of][i]].claimed = true;
emit Unlocked(_of, lockReason[_of][i], lockedTokens);
}

}


  }
}

//#LOOPVARS: i

contract address => mappingbytes32 { }

contract lockToken { }

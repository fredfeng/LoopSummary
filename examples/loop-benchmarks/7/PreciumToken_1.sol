
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) unlockQuantity;
uint lockPeriod;
address _from;
mapping(address => lockInfo[]) tokenLockInfo;
uint256 lockQuantity;
uint256 lockTotalQuantity;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokenLockInfo[_from].length; i++){
lockQuantity = tokenLockInfo[_from][i].lockQuantity;
lockPeriod = tokenLockInfo[_from][i].lockPeriod;
if (lockPeriod <= now && lockQuantity != 0) {
unlockQuantity[_from] = (unlockQuantity[_from]) + (lockQuantity);
tokenLockInfo[_from][i].lockQuantity = 0;
lockQuantity = tokenLockInfo[_from][i].lockQuantity;
}

lockTotalQuantity = (lockTotalQuantity) + (lockQuantity);
}


  }
}

//#LOOPVARS: i

contract lockInfo { }


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) unlockQuantity;
uint lockPeriod;
mapping(address => lockInfo[]) tokenLockInfo;
uint256 lockQuantity;
uint256 lockTotalQuantity;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokenLockInfo[msg.sender].length; i++){
lockQuantity = tokenLockInfo[msg.sender][i].lockQuantity;
lockPeriod = tokenLockInfo[msg.sender][i].lockPeriod;
if (lockPeriod <= now && lockQuantity != 0) {
unlockQuantity[msg.sender] = (unlockQuantity[msg.sender]) + (lockQuantity);
tokenLockInfo[msg.sender][i].lockQuantity = 0;
lockQuantity = tokenLockInfo[msg.sender][i].lockQuantity;
}

lockTotalQuantity = (lockTotalQuantity) + (lockQuantity);
}


  }
}

//#LOOPVARS: i

contract lockInfo { }

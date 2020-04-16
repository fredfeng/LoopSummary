
pragma solidity ^0.5.10;



contract C {
  

  epoch[] epochs;
uint256 needLockBalance;
uint256 i;

  function foo() public {
    
for(uint256 i; i < epochs.length; i++){
if (now < epochs[i].endTime) {
needLockBalance = (needLockBalance) + (epochs[i].amount);
}

}


  }
}

//#LOOPVARS: i

contract epoch { }

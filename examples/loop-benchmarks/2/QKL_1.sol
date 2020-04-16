
pragma solidity ^0.5.10;



contract C {
  

  epoch[] epochs;
uint256 needLockBalance;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < epochs.length; i++){
if (now < epochs[i].lockEndTime) {
needLockBalance = (needLockBalance) + (epochs[i].lockAmount);
}

}


  }
}

//#LOOPVARS: i

contract epoch { }

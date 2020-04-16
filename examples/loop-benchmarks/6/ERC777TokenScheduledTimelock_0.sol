
pragma solidity ^0.5.10;



contract C {
  

  uint256 n;
uint256 till;
Timelock[] timelocks;
uint256 i;
uint256 timestamp;
uint256 tokens;

  function foo() public {
    
for(uint256 i = 0; i < n; i++){
Timelock timelock = timelocks[i];
till = timelock.till;
if (till > 0 && till <= timestamp) {
tokens = (tokens) + (timelock.amount);
timelock.amount = 0;
timelock.till = 0;
}

}


  }
}

//#LOOPVARS: i

contract Timelock { }

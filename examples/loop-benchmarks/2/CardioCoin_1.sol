
pragma solidity ^0.5.10;



contract C {
  

  uint UNLOCK_TEN_PERCENT_PERIOD;
uint timestamp;
uint count;
uint nowFixed;
uint _unlockCount;

  function foo() public {
    
while(timestamp < nowFixed && _unlockCount + count < 10){
count++;
timestamp += UNLOCK_TEN_PERCENT_PERIOD;
}

  }
}

//#LOOPVARS: 

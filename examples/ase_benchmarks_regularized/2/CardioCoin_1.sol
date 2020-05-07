






contract C {
uint256 now;  

  

  uint UNLOCK_TEN_PERCENT_PERIOD;
uint nowFixed;
uint _unlockCount;
uint count;
uint timestamp;

  function foo() public {
    
while(timestamp < nowFixed && _unlockCount + count < 10){
count++;
timestamp += UNLOCK_TEN_PERCENT_PERIOD;
}

  }

  

}

//#LOOPVARS: i



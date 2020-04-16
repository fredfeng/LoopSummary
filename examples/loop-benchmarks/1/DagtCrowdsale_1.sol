
pragma solidity ^0.5.10;



contract C {
  

  uint256 openingTime;
uint256 _time;
uint32[] BONUS_TIMES;
uint i;
uint32[] BONUS_TIMES_VALUES;

  function foo() public {
    
for(uint i = 0; i < BONUS_TIMES.length; i++){
if ((_time) - (openingTime) <= BONUS_TIMES[i]) {
return BONUS_TIMES_VALUES[i];
}

}


  }
}

//#LOOPVARS: i

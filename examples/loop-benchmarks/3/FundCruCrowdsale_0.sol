
pragma solidity ^0.5.10;



contract C {
  

  uint256 newState;
uint256 i;
uint256 timePassed;
uint256 currentState;
uint256[] durationOfState;
uint256 sumTime;
uint256 lastState;

  function foo() public {
    
for(uint256 i = currentState; i < lastState; i++){
sumTime = (sumTime) + (durationOfState[i]);
if (sumTime >= timePassed) {
newState = i;
break;
}

}


  }
}

//#LOOPVARS: i

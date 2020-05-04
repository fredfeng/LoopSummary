






contract C {
  

  

  uint256 sumTime;
uint256 timePassed;
uint256 lastState;
uint256 currentState;
uint256 newState;
uint256[] durationOfState;

  function foo() public {
    
for(uint256 i = currentState; i < lastState; i++){
sumTime = ((sumTime) + (durationOfState[i]));
if (sumTime >= timePassed) {
newState = i;
break;
}

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  uint256 lastState;
uint256 currentState;
uint256 totalSupply;
uint256 newState;
uint256[] goalOfState;

  function foo() public {
    
for(uint256 i = currentState; i < lastState; i++){
if (goalOfState[i] > totalSupply) {
newState = i;
break;
}

}


  }

  

}

//#LOOPVARS: i



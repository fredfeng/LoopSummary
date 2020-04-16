
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
uint256[] goalOfState;
uint256 newState;
uint256 i;
uint256 currentState;
uint256 lastState;

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

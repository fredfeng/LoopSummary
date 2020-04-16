
pragma solidity ^0.5.10;



contract C {
  

  uint256[] conversionRateOfState;
uint256[] _goalOfState;
uint256[] goalOfState;
uint256 i;
uint256[] _durationOfState;
uint256[] durationOfState;
uint256[] _conversionRateOfState;
uint256 lastState;

  function foo() public {
    
for(uint256 i = 0; i <= lastState; i++){
goalOfState.push((_goalOfState[i]) * (1 ether));
durationOfState.push(_durationOfState[i]);
conversionRateOfState.push(_conversionRateOfState[i]);
}


  }
}

//#LOOPVARS: i

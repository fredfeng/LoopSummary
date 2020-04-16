
pragma solidity ^0.5.10;



contract C {
  

  uint256 _weiAmount;
uint256[] rateStepsValue;
uint256 i;
uint256[] rateSteps;

  function foo() public {
    
for(uint256 i = 0; i < rateSteps.length; i++){
if (_weiAmount >= rateSteps[i]) {
return rateStepsValue[i];
}

}


  }
}

//#LOOPVARS: i

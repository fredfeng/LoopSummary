
pragma solidity ^0.5.10;



contract C {
  

  uint256 chainLength;
uint id;
uint256 totalFee;
uint256[] chainFees;

  function foo() public {
    
for(uint id = 0; id < chainLength; id++){
totalFee = totalFee + chainFees[id];
}


  }
}

//#LOOPVARS: id

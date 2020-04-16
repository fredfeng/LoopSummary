
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
mapping(uint8 => uint256) totalForOutcome;
uint256 total;
uint8 numberOfOutcomes;

  function foo() public {
    
for(uint8 i = 0; i < numberOfOutcomes; i++){
total = (total) + (totalForOutcome[i]);
}


  }
}

//#LOOPVARS: i

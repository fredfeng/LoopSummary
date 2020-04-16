
pragma solidity ^0.5.10;



contract C {
  

  uint reward;
uint nWinners;
uint i;
mapping(uint => PredUnit) winners;

  function foo() public {
    
for(i = 0; i < nWinners; i++){
winners[i].submitter.transfer(reward);
}


  }
}

//#LOOPVARS: i

contract PredUnit { }

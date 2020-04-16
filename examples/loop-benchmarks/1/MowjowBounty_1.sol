
pragma solidity ^0.5.10;



contract C {
  

  BonusSchedule[] tranches;
uint i;
uint256 sumFreeTokens;

  function foo() public {
    
for(uint i = 0; i < tranches.length; i++){
sumFreeTokens = (sumFreeTokens) + (tranches[i].valueForTranche);
}


  }
}

//#LOOPVARS: i

contract BonusSchedule { }

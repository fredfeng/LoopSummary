
pragma solidity ^0.5.10;



contract C {
  

  BonusSchedule[] tranches;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < tranches.length; i++){
if (tranches[i].valueForTranche > 0) {
return i;
}

}


  }
}

//#LOOPVARS: i

contract BonusSchedule { }

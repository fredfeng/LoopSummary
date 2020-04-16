
pragma solidity ^0.5.10;



contract C {
  

  uint[] _rates;
BonusSchedule[] tranches;
uint[] _valueForTranches;
uint256[] _bonuses;
uint i;

  function foo() public {
    
for(uint i = 0; i < _bonuses.length; i++){
tranches.push(BonusSchedule(_bonuses[i], _valueForTranches[i], _rates[i]));
}


  }
}

//#LOOPVARS: i

contract BonusSchedule { }

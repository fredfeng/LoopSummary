
pragma solidity ^0.5.10;



contract C {
  

  Bonus[] timeBonus;
uint[] _bonuses;
uint i;
uint lastTimeOrAmount;

  function foo() public {
    
for(uint i = 0; i < _bonuses.length / 2; i++){
timeBonus[i].timeOrAmount = _bonuses[i * 2];
timeBonus[i].rateMultiplier = _bonuses[i * 2 + 1];
require(!((lastTimeOrAmount != 0) && (timeBonus[i].rateMultiplier != 100) && (timeBonus[i].timeOrAmount <= lastTimeOrAmount)));
lastTimeOrAmount = timeBonus[i].timeOrAmount;
}


  }
}

//#LOOPVARS: i

contract Bonus { }

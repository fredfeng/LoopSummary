
pragma solidity ^0.5.10;



contract C {
  

  Bonus[] amountBonus;
uint[] _bonuses;
uint i;
uint lastTimeOrAmount;

  function foo() public {
    
for(uint i = 0; i < _bonuses.length / 2; i++){
amountBonus[i].timeOrAmount = _bonuses[i * 2];
amountBonus[i].rateMultiplier = _bonuses[i * 2 + 1];
require(!((lastTimeOrAmount != 0) && (amountBonus[i].timeOrAmount >= lastTimeOrAmount)));
lastTimeOrAmount = amountBonus[i].timeOrAmount;
}


  }
}

//#LOOPVARS: i

contract Bonus { }

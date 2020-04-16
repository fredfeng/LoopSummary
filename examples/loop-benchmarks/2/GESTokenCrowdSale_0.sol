
pragma solidity ^0.5.10;



contract C {
  

  uint256 tokensToAdd;
uint256 tokens;
TimeBonus[] timeBonuses;
uint j;
uint256 diffInSeconds;
uint i;

  function foo() public {
    
for(uint j = i; j < timeBonuses.length; j++){
if (diffInSeconds <= timeBonuses[j].bonusPeriodEndTime) {
tokensToAdd = ((tokens) * (timeBonuses[j].percent)) / (100);
return (tokens) + (tokensToAdd);
}

}


  }
}

//#LOOPVARS: j

contract TimeBonus { }

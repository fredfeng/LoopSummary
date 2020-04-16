
pragma solidity ^0.5.10;



contract C {
  

  Bonus[] timeBonus;
uint i;

  function foo() public {
    
for(i = 0; i < timeBonus.length; i++){
if (block.timestamp < timeBonus[i].timeOrAmount) {
return timeBonus[i].rateMultiplier;
}

}


  }
}

//#LOOPVARS: i

contract Bonus { }

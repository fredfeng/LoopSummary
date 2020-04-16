
pragma solidity ^0.5.10;



contract C {
  

  uint256 preIcoDiffInSeconds;
Bonus[] preIcoBonuses;
uint256 offset;
uint i;

  function foo() public {
    
for(i = 0; i < preIcoBonuses.length; i++){
if (preIcoDiffInSeconds <= preIcoBonuses[i].duration + offset) {
return preIcoBonuses[i].percent;
}

offset = (offset) + (preIcoBonuses[i].duration);
}


  }
}

//#LOOPVARS: i

contract Bonus { }

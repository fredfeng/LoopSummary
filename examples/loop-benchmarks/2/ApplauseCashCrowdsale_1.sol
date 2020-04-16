
pragma solidity ^0.5.10;



contract C {
  

  Bonus[] icoBonuses;
uint256 offset;
uint i;
uint256 icoDiffInSeconds;

  function foo() public {
    
for(i = 0; i < icoBonuses.length; i++){
if (icoDiffInSeconds <= icoBonuses[i].duration + offset) {
return icoBonuses[i].percent;
}

offset = (offset) + (icoBonuses[i].duration);
}


  }
}

//#LOOPVARS: i

contract Bonus { }

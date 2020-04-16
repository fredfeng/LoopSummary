
pragma solidity ^0.5.10;



contract C {
  

  Rare rare;
uint256 time_diff;
uint256 fiveHoursInSeconds;

  function foo() public {
    
while(time_diff >= fiveHoursInSeconds){
time_diff = (time_diff - fiveHoursInSeconds);
rare.price = SafeMath.mul(SafeMath.div(rare.price, 100), 75);
}

  }
}

//#LOOPVARS: 

contract Rare { }

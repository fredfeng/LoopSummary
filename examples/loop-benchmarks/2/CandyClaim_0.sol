
pragma solidity ^0.5.10;



contract C {
  

  Candy candy;
uint256 time_diff;
uint256 fiveHoursInSeconds;

  function foo() public {
    
while(time_diff >= fiveHoursInSeconds){
time_diff = (time_diff - fiveHoursInSeconds);
candy.price = SafeMath.mul(SafeMath.div(candy.price, 100), 90);
}

  }
}

//#LOOPVARS: 

contract Candy { }


pragma solidity ^0.5.10;



contract C {
  

  uint q;
User user;

  function foo() public {
    
for(uint q = 0; q < user.contributions.length; q++){
if (now > user.contributions[q].time + 1 weeks) {
user.amountAvailableToWithdraw = (user.amountAvailableToWithdraw) + (user.contributions[q].amount);
}

}


  }
}

//#LOOPVARS: q

contract User { }

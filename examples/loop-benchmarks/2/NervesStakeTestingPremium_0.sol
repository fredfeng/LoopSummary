
pragma solidity ^0.5.10;



contract C {
  

  uint amount;
uint q;
User currentUser;

  function foo() public {
    
for(uint q = 0; q < currentUser.contributions.length; q++){
if (now > currentUser.contributions[q].time + 24 hours) {
amount = (amount) + (currentUser.contributions[q].amount);
}

}


  }
}

//#LOOPVARS: q

contract User { }


pragma solidity ^0.5.10;



contract C {
  

  uint lockedTokens;
uint i;
User user;

  function foo() public {
    
for(i = 0; i < user.contributions.length; i++){
if (now < user.contributions[i].time + 1 weeks) {
lockedTokens = (lockedTokens) + (user.contributions[i].amount);
}

}


  }
}

//#LOOPVARS: i

contract User { }

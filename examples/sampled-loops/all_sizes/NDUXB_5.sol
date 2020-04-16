
pragma solidity ^0.5.10;



contract C {
  

  uint total;
uint minAge;
uint percent;
uint maxToSend;
uint it;
address[] users;

  function foo() public {
    
for(uint it = 0; it < users.length; ++it){
address user = users[it];
uint balance = calculateTokensEnabledOne(user, minAge);
if (balance > 0) {
uint toSend = ((balance) * (percent)) / (100);
total += toSend;
transfer(user, ((balance) * (percent)) / (100));
require(total <= maxToSend);
}

}


  }
}

//#LOOPVARS: it


pragma solidity ^0.5.10;



contract C {
  

  address[] users;
uint total;
uint it;
uint minAge;

  function foo() public {
    
for(uint it = 0; it < users.length; ++it){
total += calculateTokensEnabledOne(users[it], minAge);
}


  }
}

//#LOOPVARS: it

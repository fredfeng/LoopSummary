
pragma solidity ^0.5.10;



contract C {
  

  uint[] __balances;
uint total;
uint minAge;
uint it;
address[] users;

  function foo() public {
    
for(uint it = 0; it < users.length; ++it){
address user = users[it];
uint balance = calculateTokensEnabledOne(user, minAge);
__balances[it] = balance;
total += balance;
}


  }
}

//#LOOPVARS: it

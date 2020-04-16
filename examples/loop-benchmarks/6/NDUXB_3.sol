
pragma solidity ^0.5.10;



contract C {
  

  uint ethersPerToken;
uint[] __balances;
uint balance;
address user;
uint it;
address[] users;

  function foo() public {
    
for(it = 0; it < users.length; ++it){
user = users[it];
balance = __balances[it];
uint ethers = balance * ethersPerToken;
if (balance > 0) user.transfer(balance * ethersPerToken);

emit SendMiningProfit(user, balance, ethers);
}


  }
}

//#LOOPVARS: it

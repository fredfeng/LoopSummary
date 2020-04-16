
pragma solidity ^0.5.10;



contract C {
  

  uint256 cyles;
uint256 referalBonus;
mapping(address => uint256) balances;
mapping(address => uint256) balancesTotal;
uint256 nextUserId;
address[] users;
uint i;
uint256 existLastIndex;

  function foo() public {
    
for(uint i = 1; i <= cyles; i++){
nextUserId = (nextUserId) + (1);
if (nextUserId > existLastIndex) {
nextUserId = 0;
}

balances[users[nextUserId]] = (balances[users[nextUserId]]) + ((referalBonus) / (cyles));
balancesTotal[users[nextUserId]] = (balancesTotal[users[nextUserId]]) + ((referalBonus) / (cyles));
emit BalanceUp(users[nextUserId], (referalBonus) / (cyles));
}


  }
}

//#LOOPVARS: i

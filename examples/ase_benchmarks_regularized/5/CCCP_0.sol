






contract C {
  

  

  uint256 referalBonus;
mapping(address => uint256) balancesTotal;
address[] users;
uint256 existLastIndex;
uint256 nextUserId;
uint256 cyles;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 1; i <= cyles; i++){
nextUserId = ((nextUserId) + (1));
if (nextUserId > existLastIndex) {
nextUserId = 0;
}

balances[users[nextUserId]] = ((balances[users[nextUserId]]) + (((referalBonus) / (cyles))));
balancesTotal[users[nextUserId]] = ((balancesTotal[users[nextUserId]]) + (((referalBonus) / (cyles))));

}


  }

  

}

//#LOOPVARS: i



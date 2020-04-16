
pragma solidity ^0.5.10;



contract C {
  

  uint256 cyles;
mapping(address => uint256) balancesTotal;
mapping(address => uint256) balances;
uint256 secondHalfStart;
uint256 nextForwardUserId;
address to;
uint256 interes;
mapping(address => address) users2users;
uint256 nextBackUserId;
mapping(address => uint256) collectBalances;
uint256 firstHalfEnd;
uint256 queueInteres;
uint256 collect;
uint256 reminder;
address[] users;
uint i;
uint256 existLastIndex;

  function foo() public {
    
for(uint i = 1; i <= cyles; i++){
if ((collectBalances[users[nextForwardUserId]]) + (queueInteres) >= collect) {
reminder = (collectBalances[users[nextForwardUserId]]) + (queueInteres) - collect;
balancesTotal[users[nextForwardUserId]] = (balancesTotal[users[nextForwardUserId]]) + (interes);
balances[users[nextForwardUserId]] = (balances[users[nextForwardUserId]]) + (interes);
collectBalances[users[nextForwardUserId]] = reminder;
emit BalanceUp(users[nextForwardUserId], interes, now);
to = users[nextForwardUserId];
_removeIndex(serchIndexByAddress(users[nextForwardUserId]));
_queue(to, users2users[to]);
if (nextForwardUserId == 0) {
nextForwardUserId = firstHalfEnd;
} else {
nextForwardUserId = (nextForwardUserId) - (1);
}

} else {
collectBalances[users[nextForwardUserId]] = (collectBalances[users[nextForwardUserId]]) + (queueInteres);
}

if ((collectBalances[users[nextBackUserId]]) + (queueInteres) == collect) {
reminder = (collectBalances[users[nextBackUserId]]) + (queueInteres) - collect;
balancesTotal[users[nextBackUserId]] = (balancesTotal[users[nextBackUserId]]) + (interes);
balances[users[nextBackUserId]] = (balances[users[nextBackUserId]]) + (interes);
collectBalances[users[nextBackUserId]] = reminder;
emit BalanceUp(users[nextBackUserId], interes, now);
to = users[nextBackUserId];
_removeIndex(serchIndexByAddress(users[nextBackUserId]));
_queue(to, users2users[to]);
if (nextBackUserId == existLastIndex) {
nextBackUserId = secondHalfStart;
} else {
nextBackUserId = (nextBackUserId) + (1);
}

} else {
collectBalances[users[nextBackUserId]] = (collectBalances[users[nextBackUserId]]) + (queueInteres);
}

}


  }
}

//#LOOPVARS: i

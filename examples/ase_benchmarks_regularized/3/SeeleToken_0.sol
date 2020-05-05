






contract C {
  

  

  mapping(address => uint) lockedBalances;
mapping(address => uint256) balances;
address[] receipents;

  function foo() public {
    
for(uint i = 0; i < receipents.length; i++){
address receipent = receipents[i];
balances[receipent] = ((balances[receipent]) + (lockedBalances[receipent]));
lockedBalances[receipent] = 0;
}


  }

  

}

//#LOOPVARS: i



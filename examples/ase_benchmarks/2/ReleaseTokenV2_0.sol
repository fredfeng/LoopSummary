






contract C {
  

  

  uint256 i;
address[] frozenAccounts;

  function foo() public {
    
while(i < ((frozenAccounts.length) - (1))){
frozenAccounts[i] = frozenAccounts[((i) + (1))];
i = ((i) + (1));
}

  }

  

}

//#LOOPVARS: i



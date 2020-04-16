
pragma solidity ^0.5.10;



contract C {
  

  address[] frozenAccounts;
uint256 i;

  function foo() public {
    
while(i < (frozenAccounts.length) - (1)){
frozenAccounts[i] = frozenAccounts[(i) + (1)];
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

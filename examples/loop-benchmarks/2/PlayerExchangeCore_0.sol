
pragma solidity ^0.5.10;



contract C {
  

  uint[] shares;
address[] addresses;
address[] tokenHolders;
uint tokenHolderCount;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokenHolderCount; i++){
addresses[i] = tokenHolders[i];
shares[i] = balanceOf(tokenHolders[i]);
}


  }
}

//#LOOPVARS: i

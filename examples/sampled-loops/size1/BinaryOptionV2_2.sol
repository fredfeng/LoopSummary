
pragma solidity ^0.5.10;



contract C {
  

  uint[] listAmount;
uint MAX_INVESTOR;
uint i;
Session session;

  function foo() public {
    
for(uint i = 0; i < MAX_INVESTOR; i++){
listAmount[i] = session.amountInvest[i];
}


  }
}

//#LOOPVARS: i

contract Session { }

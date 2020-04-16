
pragma solidity ^0.5.10;



contract C {
  

  uint MAX_INVESTOR;
uint i;
Session session;

  function foo() public {
    
for(uint i = 0; i < MAX_INVESTOR; i++){
session.investor[i] = 0x0;
session.win[i] = false;
session.amountInvest[i] = 0;
}


  }
}

//#LOOPVARS: i

contract Session { }

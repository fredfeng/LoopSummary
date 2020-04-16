
pragma solidity ^0.5.10;



contract C {
  

  address[] listInvestor;
Session session;
uint MAX_INVESTOR;
uint i;

  function foo() public {
    
for(uint i = 0; i < MAX_INVESTOR; i++){
listInvestor[i] = session.investor[i];
}


  }
}

//#LOOPVARS: i

contract Session { }

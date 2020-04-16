
pragma solidity ^0.5.10;



contract C {
  

  bool[] listChooses;
uint MAX_INVESTOR;
uint i;
Session session;

  function foo() public {
    
for(uint i = 0; i < MAX_INVESTOR; i++){
listChooses[i] = session.win[i];
}


  }
}

//#LOOPVARS: i

contract Session { }


pragma solidity ^0.5.10;



contract C {
  

  uint total;
Team[] teams;
uint i;

  function foo() public {
    
for(uint i = 0; i < teams.length; i++){
total += teams[i].bets;
}


  }
}

//#LOOPVARS: i

contract Team { }

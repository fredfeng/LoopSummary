
pragma solidity ^0.5.10;



contract C {
  

  address[] players;
uint i;

  function foo() public {
    
for(uint i = 0; i < players.length; i++){
if (players[i] == msg.sender) return true;

}


  }
}

//#LOOPVARS: i

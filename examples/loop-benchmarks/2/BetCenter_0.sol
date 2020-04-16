
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => Player) playerInfo;
address[] players;
uint i;

  function foo() public {
    
for(uint i = 0; i < players.length; i++){
players[i].transfer(playerInfo[players[i]].betAmount);
LogRefund(players[i], playerInfo[players[i]].betAmount);
}


  }
}

//#LOOPVARS: i

contract Player { }

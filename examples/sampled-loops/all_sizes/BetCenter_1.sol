
pragma solidity ^0.5.10;



contract C {
  

  address[] players;
uint winOdds;
mapping(address => Player) playerInfo;
uint i;
uint8 winChoice;

  function foo() public {
    
for(uint i = 0; i < players.length; i++){
if (playerInfo[players[i]].choice == winChoice) {
players[i].transfer(((winOdds) * (playerInfo[players[i]].betAmount)) / (100));
LogDistributeReward(players[i], ((winOdds) * (playerInfo[players[i]].betAmount)) / (100), i);
}

}


  }
}

//#LOOPVARS: i

contract Player { }

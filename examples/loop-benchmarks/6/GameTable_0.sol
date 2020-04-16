
pragma solidity ^0.5.10;



contract C {
  

  uint gameid;
uint winnerID;
mapping(uint => Game) games;
uint totalReturn;
uint ratio;
uint i;

  function foo() public {
    
for(uint i = 0; i < games[gameid].options[winnerID].numPlayers; i++){
uint returnWinAmount = (games[gameid].options[winnerID].players[i].amount) * (ratio);
returnWinAmount = (returnWinAmount) / (100);
returnWinAmount = (games[gameid].options[winnerID].players[i].amount) + (returnWinAmount);
games[gameid].options[winnerID].players[i].addr.transfer(returnWinAmount);
games[gameid].options[winnerID].players[i].profit = returnWinAmount;
totalReturn = (totalReturn) + (returnWinAmount);
}


  }
}

//#LOOPVARS: i

contract Game { }

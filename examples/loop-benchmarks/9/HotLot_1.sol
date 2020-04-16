
pragma solidity ^0.5.10;



contract C {
  

  Player[] players;
address wallet3;
uint256 luckyNumber3;
address wallet2;
uint256 i;
uint256 luckyNumber1;
uint256 count;
uint256 luckyNumber2;
address wallet1;

  function foo() public {
    
for(uint256 i = 0; i < players.length; i++){
if (players[i].playingJackpot) {
count = (count) + (1);
if (count == luckyNumber1) {
wallet1 = players[i].wallet;
}

if (count == luckyNumber2) {
wallet2 = players[i].wallet;
}

if (count == luckyNumber3) {
wallet3 = players[i].wallet;
}

players[i].playing = false;
}

}


  }
}

//#LOOPVARS: i

contract Player { }

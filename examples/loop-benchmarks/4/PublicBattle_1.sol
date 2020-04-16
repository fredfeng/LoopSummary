
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) playerGuessPM1Number;
uint pbWinner;
mapping(address => uint) playerGuessPM2Number;
uint cdel1;
mapping(uint => address[]) pokemonGuessPlayers;
uint publicBattlepm1;
address guesser;

  function foo() public {
    
for(uint cdel1 = 0; cdel1 < pokemonGuessPlayers[pbWinner].length; cdel1++){
guesser = pokemonGuessPlayers[pbWinner][cdel1];
if (pbWinner == publicBattlepm1) {
delete playerGuessPM1Number[guesser];
} else {
delete playerGuessPM2Number[guesser];
}

}


  }
}

//#LOOPVARS: cdel1

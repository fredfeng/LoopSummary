
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) playerGuessPM1Number;
uint pbWinner;
mapping(address => uint) playerGuessPM2Number;
mapping(uint => address[]) pokemonGuessPlayers;
uint counter;
mapping(uint => uint) pokemonGuessPrize;
uint publicBattlepm1;
uint totalGuess;
address guesser;

  function foo() public {
    
for(uint counter = 0; counter < pokemonGuessPlayers[pbWinner].length; counter++){
guesser = pokemonGuessPlayers[pbWinner][counter];
if (pbWinner == publicBattlepm1) {
guesser.transfer(((playerGuessPM1Number[guesser]) * (totalGuess)) / (pokemonGuessPrize[pbWinner]));
} else {
guesser.transfer(((playerGuessPM2Number[guesser]) * (totalGuess)) / (pokemonGuessPrize[pbWinner]));
}

}


  }
}

//#LOOPVARS: counter

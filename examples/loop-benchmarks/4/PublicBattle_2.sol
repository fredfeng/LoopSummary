
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) playerGuessPM1Number;
mapping(address => uint) playerGuessPM2Number;
mapping(uint => address[]) pokemonGuessPlayers;
uint cdel;
uint publicBattlepm1;
address guesser;
uint del;

  function foo() public {
    
for(uint cdel = 0; cdel < pokemonGuessPlayers[del].length; cdel++){
guesser = pokemonGuessPlayers[del][cdel];
if (del == publicBattlepm1) {
delete playerGuessPM1Number[guesser];
} else {
delete playerGuessPM2Number[guesser];
}

}


  }
}

//#LOOPVARS: cdel


pragma solidity ^0.5.10;



contract C {
  

  address cardAddress;
address[] cardsOfOpponent;
address[] opponentCardChoices;
uint256 indexOfClaimableCard;
uint256 tmpModulus;
uint256 i;
uint256 tmpSeed;

  function foo() public {
    
for(uint256 i = 0; i < 3; i++){
if (i == indexOfClaimableCard) {
opponentCardChoices[i] = cardAddress;
} else {
(tmpSeed, tmpModulus) = tmpQuerySeed(tmpSeed, cardsOfOpponent.length);
opponentCardChoices[i] = cardsOfOpponent[tmpModulus];
}

}


  }
}

//#LOOPVARS: i

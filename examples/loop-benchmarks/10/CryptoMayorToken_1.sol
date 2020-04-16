
pragma solidity ^0.5.10;



contract C {
  

  uint256[] ownerTokens;
uint256 LANDMARK;
uint256 otherPoolTotal;
uint256 cityPoolTotal;
mapping(uint256 => Token) tokens;
uint256 OTHER;
uint256 i;
uint256 landmarkPoolTotal;
uint256 CITY;
uint256 owed;

  function foo() public {
    
for(uint256 i = 0; i < ownerTokens.length; i++){
uint256 totalOwed;
if (tokens[ownerTokens[i]].kind == CITY) {
totalOwed = cityPoolTotal * tokens[ownerTokens[i]].payout / 10000;
} else if (tokens[ownerTokens[i]].kind == LANDMARK) {
totalOwed = landmarkPoolTotal * tokens[ownerTokens[i]].payout / 10000;
} else if (tokens[ownerTokens[i]].kind == OTHER) {
totalOwed = otherPoolTotal * tokens[ownerTokens[i]].payout / 10000;
}



uint256 totalTokenOwed = (totalOwed) - (tokens[ownerTokens[i]].withdrawn);
owed += totalTokenOwed;
tokens[ownerTokens[i]].withdrawn += totalTokenOwed;
}


  }
}

//#LOOPVARS: i

contract Token { }

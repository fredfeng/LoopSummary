
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[][] allCards;
uint256[][] allAttackFigures;
uint256[][] allDefenceFigures;
uint256 i;

  function foo() public {
    
for(i = 0; i < 3; i++){
if (allCards[0][i]._cardModifier == uint256(MODIFIER.V_ATT)) {
if (allCards[1][i]._cardType == allCards[0][i]._modifierPrimarayVal) {
allAttackFigures[0][i] += allCards[0][i]._modifierSecondaryVal;
}

} else if (allCards[0][i]._cardModifier == uint256(MODIFIER.V_DEF)) {
if (allCards[1][i]._cardType == allCards[0][i]._modifierPrimarayVal) {
allDefenceFigures[0][i] += allCards[0][i]._modifierSecondaryVal;
}

}


if (allCards[1][i]._cardModifier == uint256(MODIFIER.V_ATT)) {
if (allCards[0][i]._cardType == allCards[1][i]._modifierPrimarayVal) {
allAttackFigures[1][i] += allCards[1][i]._modifierSecondaryVal;
}

} else if (allCards[1][i]._cardModifier == uint256(MODIFIER.V_DEF)) {
if (allCards[0][i]._cardType == allCards[1][i]._modifierPrimarayVal) {
allDefenceFigures[1][i] += allCards[1][i]._modifierSecondaryVal;
}

}


}


  }
}

//#LOOPVARS: i

contract AddressCard { }

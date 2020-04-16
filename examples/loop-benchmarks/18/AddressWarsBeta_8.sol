
pragma solidity ^0.5.10;



contract C {
  

  bool[] allOfSameType;
uint256[] cumulativeDefenceBonuses;
uint256[] cumulativeAttackBonuses;
uint256 i;
AddressCard[][] allCards;

  function foo() public {
    
for(i = 0; i < 3; i++){
if (i > 0 && allCards[0][i]._cardType != allCards[0][i - 1]._cardType) {
allOfSameType[0] = false;
}

if (allCards[0][i]._cardModifier == uint256(MODIFIER.ALL_ATT)) {
cumulativeAttackBonuses[0] += allCards[0][i]._modifierPrimarayVal;
} else if (allCards[0][i]._cardModifier == uint256(MODIFIER.ALL_DEF)) {
cumulativeDefenceBonuses[0] += allCards[0][i]._modifierPrimarayVal;
} else if (allCards[0][i]._cardModifier == uint256(MODIFIER.ALL_ATT_DEF)) {
cumulativeAttackBonuses[0] += allCards[0][i]._modifierPrimarayVal;
cumulativeDefenceBonuses[0] += allCards[0][i]._modifierSecondaryVal;
}



if (i > 0 && allCards[1][i]._cardType != allCards[1][i - 1]._cardType) {
allOfSameType[1] = false;
}

if (allCards[1][i]._cardModifier == uint256(MODIFIER.ALL_ATT)) {
cumulativeAttackBonuses[1] += allCards[1][i]._modifierPrimarayVal;
} else if (allCards[1][i]._cardModifier == uint256(MODIFIER.ALL_DEF)) {
cumulativeDefenceBonuses[1] += allCards[1][i]._modifierPrimarayVal;
} else if (allCards[1][i]._cardModifier == uint256(MODIFIER.ALL_ATT_DEF)) {
cumulativeAttackBonuses[1] += allCards[1][i]._modifierPrimarayVal;
cumulativeDefenceBonuses[1] += allCards[1][i]._modifierSecondaryVal;
}



}


  }
}

//#LOOPVARS: i

contract AddressCard { }

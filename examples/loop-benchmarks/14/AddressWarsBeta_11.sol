
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[][] allCards;
uint256[][] allAttackFigures;
uint256[][] allDefenceFigures;
uint256 i;

  function foo() public {
    
for(i = 0; i < 3; i++){
if (allCards[1][i]._cardModifier != uint256(MODIFIER.R_V)) {
if ((allCards[0][i]._cardType == uint256(TYPE.FIRE) && allCards[1][i]._cardType == uint256(TYPE.NATURE)) || (allCards[0][i]._cardType == uint256(TYPE.WATER) && allCards[1][i]._cardType == uint256(TYPE.FIRE)) || (allCards[0][i]._cardType == uint256(TYPE.NATURE) && allCards[1][i]._cardType == uint256(TYPE.WATER))) {
if (allCards[0][i]._cardModifier != uint256(MODIFIER.A_I)) {
allAttackFigures[0][i] = SafeMath.div(SafeMath.mul(allAttackFigures[0][i], 3), 2);
allDefenceFigures[0][i] = SafeMath.div(SafeMath.mul(allDefenceFigures[0][i], 3), 2);
} else {
allAttackFigures[0][i] = SafeMath.div(SafeMath.mul(allAttackFigures[0][i], 5), 4);
allDefenceFigures[0][i] = SafeMath.div(SafeMath.mul(allDefenceFigures[0][i], 5), 4);
}

}

}

if (allCards[0][i]._cardModifier != uint256(MODIFIER.R_V)) {
if ((allCards[1][i]._cardType == uint256(TYPE.FIRE) && allCards[0][i]._cardType == uint256(TYPE.NATURE)) || (allCards[1][i]._cardType == uint256(TYPE.WATER) && allCards[0][i]._cardType == uint256(TYPE.FIRE)) || (allCards[1][i]._cardType == uint256(TYPE.NATURE) && allCards[0][i]._cardType == uint256(TYPE.WATER))) {
if (allCards[1][i]._cardModifier != uint256(MODIFIER.A_I)) {
allAttackFigures[1][i] = SafeMath.div(SafeMath.mul(allAttackFigures[1][i], 3), 2);
allDefenceFigures[1][i] = SafeMath.div(SafeMath.mul(allDefenceFigures[1][i], 3), 2);
} else {
allAttackFigures[1][i] = SafeMath.div(SafeMath.mul(allAttackFigures[1][i], 5), 4);
allDefenceFigures[1][i] = SafeMath.div(SafeMath.mul(allDefenceFigures[1][i], 5), 4);
}

}

}

}


  }
}

//#LOOPVARS: i

contract AddressCard { }

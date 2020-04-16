
pragma solidity ^0.5.10;



contract C {
  

  uint256 tmp;
uint256 i;
uint256[][] allAttackFigures;
AddressCard[][] allCards;
uint256[][] allDefenceFigures;

  function foo() public {
    
for(i = 0; i < 3; i++){
if (allCards[1][i]._cardModifier == uint256(MODIFIER.V_SWAP)) {
tmp = allAttackFigures[0][i];
allAttackFigures[0][i] = allDefenceFigures[0][i];
allDefenceFigures[0][i] = tmp;
}

if (allCards[0][i]._cardModifier == uint256(MODIFIER.V_SWAP)) {
tmp = allAttackFigures[1][i];
allAttackFigures[1][i] = allDefenceFigures[1][i];
allDefenceFigures[1][i] = tmp;
}

}


  }
}

//#LOOPVARS: i

contract AddressCard { }

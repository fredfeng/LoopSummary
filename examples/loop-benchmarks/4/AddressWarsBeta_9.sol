
pragma solidity ^0.5.10;



contract C {
  

  uint256[] cumulativeDefenceBonuses;
uint256[] cumulativeAttackBonuses;
uint256 i;
uint256[][] allAttackFigures;
uint256[][] allDefenceFigures;

  function foo() public {
    
for(i = 0; i < 3; i++){
allAttackFigures[0][i] += cumulativeAttackBonuses[0];
allDefenceFigures[0][i] += cumulativeDefenceBonuses[0];
allAttackFigures[1][i] += cumulativeAttackBonuses[1];
allDefenceFigures[1][i] += cumulativeDefenceBonuses[1];
}


  }
}

//#LOOPVARS: i

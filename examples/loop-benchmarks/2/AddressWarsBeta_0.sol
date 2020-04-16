
pragma solidity ^0.5.10;



contract C {
  

  uint256[] totalHits;
uint256[][] allFinalAttackFigures;
uint256[][] allFinalDefenceFigures;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < 3; i++){
totalHits[0] += (allFinalAttackFigures[1][i] > allFinalDefenceFigures[0][i] ? allFinalAttackFigures[1][i] - allFinalDefenceFigures[0][i], 0);
totalHits[1] += (allFinalAttackFigures[0][i] > allFinalDefenceFigures[1][i] ? allFinalAttackFigures[0][i] - allFinalDefenceFigures[1][i], 0);
}


  }
}

//#LOOPVARS: i

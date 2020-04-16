
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply;
uint256[] stageCaps;
uint8 stageNumber;
uint256 tokens;
uint256 tokenBase;

  function foo() public {
    
while((tokens) + (totalSupply) > stageCaps[stageNumber] && stageNumber < 24){
stageNumber++;
tokens = getStageTokenAmount(tokenBase, stageNumber);
}

  }
}

//#LOOPVARS: 

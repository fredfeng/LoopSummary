
pragma solidity ^0.5.10;



contract C {
  

  uint256 tokensToMint;
uint256 excess;
Stage[] stages;
uint256 currentStage;

  function foo() public {
    
while(excess > 0 && currentStage < stages.length){
Stage stage = stages[currentStage];
if (excess >= stage.cap) {
excess = (excess) - (stage.cap);
tokensToMint = (tokensToMint) + (stage.cap);
stage.cap = 0;
currentStage = (currentStage) + (1);
} else {
stage.cap = (stage.cap) - (excess);
tokensToMint = (tokensToMint) + (excess);
excess = 0;
}

}

  }
}

//#LOOPVARS: 

contract Stage { }

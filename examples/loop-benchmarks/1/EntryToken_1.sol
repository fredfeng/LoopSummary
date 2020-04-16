
pragma solidity ^0.5.10;



contract C {
  

  uint8 stageNumber;
uint256 totalSupply;
uint256[] stageCaps;

  function foo() public {
    
while(stageNumber < 24 && totalSupply > stageCaps[stageNumber]){
stageNumber++;
}

  }
}

//#LOOPVARS: 

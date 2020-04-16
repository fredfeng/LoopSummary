
pragma solidity ^0.5.10;



contract C {
  

  StageInfo[] stages;
uint256 sold;
uint i;
uint256 maxStage;

  function foo() public {
    
for(uint i = 0; i < maxStage; ++i){
sold = (sold) + (stages[i].sold);
}


  }
}

//#LOOPVARS: i

contract StageInfo { }

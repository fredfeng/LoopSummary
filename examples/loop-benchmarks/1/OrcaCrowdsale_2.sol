
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _amounts;
uint256 i;
uint256 tokensInBatch;

  function foo() public {
    
for(uint256 i = 0; i < _amounts.length; i++){
tokensInBatch = (tokensInBatch) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i

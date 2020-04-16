
pragma solidity ^0.5.10;



contract C {
  

  uint blockNumber;
uint rightBlockNumber;
uint i;
uint totalBuildFee;

  function foo() public {
    
for(uint i = rightBlockNumber; i < rightBlockNumber + blockNumber; i++){
totalBuildFee = (totalBuildFee) + (getBlockBuildFee(i + 1));
}


  }
}

//#LOOPVARS: i

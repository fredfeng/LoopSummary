
pragma solidity ^0.5.10;



contract C {
  

  uint leftBlockNumber;
uint blockNumber;
uint i;
uint totalBuildFee;

  function foo() public {
    
for(uint i = leftBlockNumber; i < leftBlockNumber + blockNumber; i++){
totalBuildFee = (totalBuildFee) + (getBlockBuildFee(i + 1));
}


  }
}

//#LOOPVARS: i

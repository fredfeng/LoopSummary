
pragma solidity ^0.5.10;



contract C {
  

  uint8 decimals;
uint32[] userMiners;
uint32[] totalMiners;
uint areaOutput;
uint32 hourLength;
uint income;
uint i;

  function foo() public {
    
for(uint i = 0; i < hourLength; ++i){
if (userMiners[i] != 0 && totalMiners[i] != 0) {
income += (Math.min256(10 ** uint256(decimals), areaOutput / totalMiners[i]) * userMiners[i]);
}

}


  }
}

//#LOOPVARS: i

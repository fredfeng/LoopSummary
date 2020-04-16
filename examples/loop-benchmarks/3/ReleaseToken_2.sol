
pragma solidity ^0.5.10;



contract C {
  

  address frozenAddr;
uint256 j;
mapping(address => TimeRec[]) frozenTimes;
uint256 timeRecLen;
uint256 totalRemain;

  function foo() public {
    
while(j < timeRecLen){
TimeRec timePair = frozenTimes[frozenAddr][j];
totalRemain = (totalRemain) + (timePair.remain);
j = (j) + (1);
}

  }
}

//#LOOPVARS: 

contract TimeRec { }

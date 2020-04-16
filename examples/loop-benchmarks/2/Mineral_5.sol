
pragma solidity ^0.5.10;



contract C {
  

  uint[] distinctArea;
uint userActiveArea;
uint updateActiveArea;
uint distinctAreaLength;
uint i;

  function foo() public {
    
for(i = 0; i < distinctAreaLength; i++){
require(userActiveArea & uint(1) << distinctArea[i] > 0);
updateActiveArea = updateActiveArea | updateArea(distinctArea[i]);
}


  }
}

//#LOOPVARS: i

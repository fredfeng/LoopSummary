
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
Geometry.Rect[] subPlots;
uint256 i;

  function foo() public {
    
for(j = i + 1; j < subPlots.length; j++){
require(!Geometry.doRectanglesOverlap(subPlots[i], subPlots[j]));
}


  }
}

//#LOOPVARS: j

contract Geometry.Rect { }

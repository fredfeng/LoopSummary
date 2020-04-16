
pragma solidity ^0.5.10;



contract C {
  

  Geometry.Rect[] subPlots;
uint256 i;

  function foo() public {
    
for(i = 0; i < subPlots.length; i++){
for (j = i + 1; j < subPlots.length; j++) {
require(!Geometry.doRectanglesOverlap(subPlots[i], subPlots[j]));
}

}


  }
}

//#LOOPVARS: i

contract Geometry.Rect { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 areaIndicesIndex;
Geometry.Rect[] subPlots;
mapping(uint256 => uint256[]) holes;
PlotOwnership[] ownership;
uint256 holeIndex;
uint256 ownershipIndex;

  function foo() public {
    
for(uint256 holeIndex = 0; holeIndex < holes[ownershipIndex].length; holeIndex++){
PlotOwnership holePlot = ownership[holes[ownershipIndex][holeIndex]];
Geometry.Rect holeRect = Geometry.Rect(holePlot.x, holePlot.y, holePlot.w, holePlot.h);
require(!Geometry.doRectanglesOverlap(subPlots[areaIndicesIndex], holeRect));
}


  }
}

//#LOOPVARS: holeIndex

contract PlotOwnership { }

contract Geometry.Rect { }

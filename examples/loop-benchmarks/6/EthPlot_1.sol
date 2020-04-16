
pragma solidity ^0.5.10;



contract C {
  

  Geometry.Rect[] subPlots;
uint256 totalArea;
uint24[] purchasedAreas;
uint256[] areaIndices;
uint256 i;
Geometry.Rect plotToPurchase;

  function foo() public {
    
for(i = 0; i < areaIndices.length; i++){
Geometry.Rect rect = Geometry.Rect(purchasedAreas[(i * 4)], purchasedAreas[(i * 4) + 1], purchasedAreas[(i * 4) + 2], purchasedAreas[(i * 4) + 3]);
subPlots[i] = rect;
require(rect.w > 0);
require(rect.h > 0);
totalArea = SafeMath.add(totalArea, SafeMath.mul(rect.w, rect.h));
require(Geometry.rectContainedInside(rect, plotToPurchase));
}


  }
}

//#LOOPVARS: i

contract uint24 { }

contract Geometry.Rect { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 areaIndicesIndex;
Geometry.Rect[] subPlots;
uint256 remainingBalance;
uint256 owedToSeller;
uint256[] areaIndices;
PlotOwnership[] ownership;

  function foo() public {
    
for(uint256 areaIndicesIndex = 0; areaIndicesIndex < areaIndices.length; areaIndicesIndex++){
uint256 ownershipIndex = areaIndices[areaIndicesIndex];
Geometry.Rect currentOwnershipRect = Geometry.Rect(ownership[ownershipIndex].x, ownership[ownershipIndex].y, ownership[ownershipIndex].w, ownership[ownershipIndex].h);
require(Geometry.rectContainedInside(subPlots[areaIndicesIndex], currentOwnershipRect));
for (uint256 holeIndex = 0; holeIndex < holes[ownershipIndex].length; holeIndex++) {
PlotOwnership holePlot = ownership[holes[ownershipIndex][holeIndex]];
Geometry.Rect holeRect = Geometry.Rect(holePlot.x, holePlot.y, holePlot.w, holePlot.h);
require(!Geometry.doRectanglesOverlap(subPlots[areaIndicesIndex], holeRect));
}

uint256 sectionPrice = getPriceOfPlot(subPlots[areaIndicesIndex], ownershipIndex);
remainingBalance = SafeMath.sub(remainingBalance, sectionPrice);
owedToSeller = SafeMath.add(owedToSeller, sectionPrice);
if (areaIndicesIndex == areaIndices.length - 1 || ownershipIndex != areaIndices[areaIndicesIndex + 1]) {
address(ownership[ownershipIndex].owner).transfer(owedToSeller);
emit PlotSectionSold(ownershipIndex, owedToSeller, msg.sender, ownership[ownershipIndex].owner);
owedToSeller = 0;
}

}


  }
}

//#LOOPVARS: areaIndicesIndex

contract PlotOwnership { }

contract Geometry.Rect { }

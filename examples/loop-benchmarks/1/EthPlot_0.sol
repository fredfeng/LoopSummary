
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => uint256[]) holes;
uint256 newPlotIndex;
uint256[] areaIndices;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < areaIndices.length; i++){
holes[areaIndices[i]].push(newPlotIndex);
}


  }
}

//#LOOPVARS: i

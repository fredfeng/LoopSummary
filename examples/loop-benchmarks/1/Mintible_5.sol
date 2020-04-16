
pragma solidity ^0.5.10;



contract C {
  

  uint256 k;
uint64 _indexOffset;
uint64[] categoryIds;

  function foo() public {
    
for(uint256 k = 0; k < categoryIds.length; k++){
categoryIds[k] = (categoryIds[k]) + (_indexOffset);
}


  }
}

//#LOOPVARS: k


pragma solidity ^0.5.10;



contract C {
  

  uint64[] _categoryIds;
uint256 _length;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _categoryIds.length; i++){
require(_categoryIds[i] <= _length);
}


  }
}

//#LOOPVARS: i

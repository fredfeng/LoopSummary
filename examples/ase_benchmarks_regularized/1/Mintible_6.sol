






contract C {
  

  

  uint256 _length;
uint64[] _categoryIds;

  function foo() public {
    
for(uint256 i = 0; i < _categoryIds.length; i++){
require(_categoryIds[i] <= _length);
}


  }

  

}

//#LOOPVARS: i



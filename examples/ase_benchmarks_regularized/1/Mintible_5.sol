






contract C {
  

  

  uint64[] categoryIds;
uint64 _indexOffset;

  function foo() public {
    
for(uint256 k = 0; k < categoryIds.length; k++){
categoryIds[k] = ((categoryIds[k]) + (_indexOffset));
}


  }

  

}

//#LOOPVARS: k



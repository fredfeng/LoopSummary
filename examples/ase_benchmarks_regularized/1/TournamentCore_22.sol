






contract C {
  

  

  uint32[] ids;

  function foo() public {
    
for(uint256 i = 0; i < 11 - 1; i++){
require(ids[i] < ids[i + 1]);
}


  }

  

}

//#LOOPVARS: i



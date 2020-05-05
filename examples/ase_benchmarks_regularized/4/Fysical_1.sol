






contract C {
  

  

  uint256 previousId;
uint256 id;
uint256 idCount;
uint256[] uniqueIdsSortedAscending;

  function foo() public {
    
for(uint256 index = 1; index < uniqueIdsSortedAscending.length; index = ((index) + (1))){
id = uniqueIdsSortedAscending[index];
require(id < idCount);
require(previousId < id);
previousId = id;
}


  }

  

}

//#LOOPVARS: index



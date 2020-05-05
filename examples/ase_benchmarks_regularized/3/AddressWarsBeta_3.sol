






contract C {
  

  

  uint256[] ownerIndexes;
address owner;
uint256 currentIndex;
address[] owners;

  function foo() public {
    
for(uint256 i = 0; i < owners.length; i++){
if (owner == owners[i]) {
ownerIndexes[currentIndex] = i;
currentIndex++;
}

}


  }

  

}

//#LOOPVARS: i



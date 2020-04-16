
pragma solidity ^0.5.10;



contract C {
  

  uint256 currentIndex;
address owner;
uint256[] ownerIndexes;
uint256 i;
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


pragma solidity ^0.5.10;



contract C {
  

  uint256[] listedItems;
address _owner;
uint256 i;
uint256 counter;

  function foo() public {
    
for(uint256 i = 0; i < listedItems.length; i++){
if (ownerOf(listedItems[i]) == _owner) {
counter++;
}

}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  uint256 _index;
address _owner;
uint count;
uint256[] listedItems;
uint i;

  function foo() public {
    
for(uint i = 0; i < listedItems.length; i++){
uint itemId = listedItems[i];
if (ownerOf(itemId) == _owner) {
if (count == _index) {
return itemId;
}

count += 1;
}

}


  }
}

//#LOOPVARS: i

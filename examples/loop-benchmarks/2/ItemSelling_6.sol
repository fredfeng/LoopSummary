
pragma solidity ^0.5.10;



contract C {
  

  uint256[] itemList;
uint256 sum;
uint256 i;
mapping(uint256 => Item) items;

  function foo() public {
    
for(uint256 i = 0; i < itemList.length; i++){
if (!isAdmin(items[itemList[i]].owner)) {
sum += buybackPriceOf(itemList[i]);
}

}


  }
}

//#LOOPVARS: i

contract Item { }

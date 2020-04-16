
pragma solidity ^0.5.10;



contract C {
  

  uint64[] categoryIds;
uint256[] newIds;
uint64[] newCategoryIds;
uint256 id;
uint256 i;
uint32[] odds;
ShopItem shopItem;
mapping(uint256 => AccountItem) idToAccountItem;

  function foo() public {
    
for(uint256 i = 0; i < shopItem.numberOfOutputs; i++){
uint32 randomValue = rand(0, odds[(odds.length) - (1)]);
uint256 index = getIndexFromOdd(randomValue, odds);
idToAccountItem[id].categoryId = categoryIds[index];
_mint(msg.sender, id);
newIds[i] = id;
newCategoryIds[i] = categoryIds[index];
id++;
}


  }
}

//#LOOPVARS: i

contract AccountItem { }

contract ShopItem { }

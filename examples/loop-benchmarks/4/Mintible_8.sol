
pragma solidity ^0.5.10;



contract C {
  

  uint64 i;
uint64 _amount;
uint256 id;
uint256[] itemIds;
mapping(uint256 => AccountItem) idToAccountItem;
uint64 _categoryId;

  function foo() public {
    
for(uint64 i = 0; i < _amount; i++){
idToAccountItem[id].categoryId = _categoryId;
_mint(msg.sender, id);
itemIds[i] = id;
id++;
}


  }
}

//#LOOPVARS: i

contract AccountItem { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
uint256[] _prices;
address _owner;
uint256[] _itemIds;

  function foo() public {
    
for(uint256 i = 0; i < _itemIds.length; i++){
addItem(_itemIds[i], _prices[i], _owner);
}


  }
}

//#LOOPVARS: i

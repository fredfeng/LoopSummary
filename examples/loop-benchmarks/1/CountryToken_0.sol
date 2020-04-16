
pragma solidity ^0.5.10;



contract C {
  

  address[] _owners;
uint256[] _payouts;
uint256 i;
uint256[] _prices;
uint256[] _itemIds;

  function foo() public {
    
for(uint256 i = 0; i < _itemIds.length; i++){
createListing(_itemIds[i], _prices[i], _payouts[i], _owners[i]);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  address[] _owners;
uint256[] _payouts;
uint256 i;
uint256[] _prices;
uint256[] _lastPrices;
uint256[] _mayorTokenIds;
uint256[] _itemIds;
uint8[] _kinds;

  function foo() public {
    
for(uint256 i = 0; i < _itemIds.length; i++){
createToken(_itemIds[i], _prices[i], _lastPrices[i], _payouts[i], _kinds[i], _mayorTokenIds[i], _owners[i]);
}


  }
}

//#LOOPVARS: i

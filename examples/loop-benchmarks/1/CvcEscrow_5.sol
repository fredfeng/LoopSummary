
pragma solidity ^0.5.10;



contract C {
  

  address _idv;
address _idr;
uint256 i;
uint256 _itemIdvFee;
bytes32[] credentialItemIds;
bytes32[] _releasedItems;
bytes32 _placementId;
uint256 _itemPlatformFee;

  function foo() public {
    
for(uint256 i = 0; i < _releasedItems.length; i++){
emit EscrowReleased(_idr, _idv, _releasedItems[i], _itemPlatformFee, _itemIdvFee, credentialItemIds, _placementId);
}


  }
}

//#LOOPVARS: i

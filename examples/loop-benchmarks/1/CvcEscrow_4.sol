
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _itemsToKeep;
address _idv;
address _idr;
bytes32 newPlacementId;
uint256 i;
uint256 amountPerItem;
bytes32[] credentialItemIds;
bytes32 _placementId;

  function foo() public {
    
for(uint256 i = 0; i < _itemsToKeep.length; i++){
emit EscrowMoved(_idr, _idv, _itemsToKeep[i], amountPerItem, credentialItemIds, _placementId, newPlacementId);
}


  }
}

//#LOOPVARS: i

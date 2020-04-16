
pragma solidity ^0.5.10;



contract C {
  

  address _idv;
address _idr;
bytes32 placementId;
uint256 i;
uint256 amountPerItem;
bytes32[] _itemsToRefund;
bytes32[] credentialItemIds;

  function foo() public {
    
for(uint256 i = 0; i < _itemsToRefund.length; i++){
emit EscrowCanceled(_idr, _idv, _itemsToRefund[i], amountPerItem, credentialItemIds, placementId);
}


  }
}

//#LOOPVARS: i

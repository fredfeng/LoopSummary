
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _credentialItemIds;
address _idv;
bytes32 placementId;
uint256 i;
uint256 amountPerItem;
bytes32[] _scopeRequestIds;

  function foo() public {
    
for(uint256 i = 0; i < _scopeRequestIds.length; i++){
emit EscrowPlaced(msg.sender, _idv, _scopeRequestIds[i], amountPerItem, _credentialItemIds, placementId);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _scopeRequestIds;
uint256 i;
bytes32 batchReference;

  function foo() public {
    
for(uint256 i = 0; i < _scopeRequestIds.length; i++){
require(_scopeRequestIds[i] != 0x0, "Cannot calculate batch reference with empty scope request ID");
batchReference = batchReference ^ keccak256(abi.encodePacked(_scopeRequestIds[i]));
}


  }
}

//#LOOPVARS: i

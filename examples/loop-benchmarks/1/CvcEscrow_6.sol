
pragma solidity ^0.5.10;



contract C {
  

  uint256 i;
mapping(bytes32 => bytes32) bytes32Storage;
uint256 count;
bytes32[] credentialItemIds;
bytes32 _placementId;

  function foo() public {
    
for(uint256 i = 0; i < count; i++){
credentialItemIds[i] = bytes32Storage[keccak256(abi.encodePacked("placements.", _placementId, ".credentialItemIds.", i))];
}


  }
}

//#LOOPVARS: i

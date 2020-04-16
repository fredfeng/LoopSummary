
pragma solidity ^0.5.10;



contract C {
  

  bytes32 _placementId;
bytes32[] _credentialItemIds;
uint256 i;
mapping(bytes32 => bytes32) bytes32Storage;

  function foo() public {
    
for(uint256 i = 0; i < _credentialItemIds.length; i++){
bytes32Storage[keccak256(abi.encodePacked("placements.", _placementId, ".credentialItemIds.", i))] = _credentialItemIds[i];
}


  }
}

//#LOOPVARS: i

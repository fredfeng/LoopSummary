
pragma solidity ^0.5.10;



contract C {
  

  uint256 resourceCount;
uint256 proposalId;
mapping(uint256 => mapping(uint256 => bytes)) encryptedDecryptionKeysByProposalIdAndResourceId;
uint256 resourceIndex;
ResourceSet resourceSet;
uint256[] encryptedResourceDecryptionKeyLengths;

  function foo() public {
    
for(uint256 resourceIndex = 0; resourceIndex < encryptedResourceDecryptionKeyLengths.length; resourceIndex = (resourceIndex) + (1)){
bytes encryptedResourceDecryptionKey = new bytes(encryptedResourceDecryptionKeyLengths[resourceIndex]);
require(0 < encryptedResourceDecryptionKey.length);
for (uint256 encryptedResourceDecryptionKeyIndex = 0; encryptedResourceDecryptionKeyIndex < encryptedResourceDecryptionKey.length; encryptedResourceDecryptionKeyIndex = encryptedResourceDecryptionKeyIndex.add(1)) {
require(concatenatedEncryptedResourceDecryptionKeysIndex < concatenatedEncryptedResourceDecryptionKeys.length);
encryptedResourceDecryptionKey[encryptedResourceDecryptionKeyIndex] = concatenatedEncryptedResourceDecryptionKeys[concatenatedEncryptedResourceDecryptionKeysIndex];
concatenatedEncryptedResourceDecryptionKeysIndex = concatenatedEncryptedResourceDecryptionKeysIndex.add(1);
}

uint256 resourceId = resourceSet.uniqueResourceIdsSortedAscending[resourceIndex];
assert(resourceId < resourceCount);
encryptedDecryptionKeysByProposalIdAndResourceId[proposalId][resourceId] = encryptedResourceDecryptionKey;
}


  }
}

//#LOOPVARS: resourceIndex

contract ResourceSet { }

contract uint256 => mappinguint256 { }


pragma solidity ^0.5.10;



contract C {
  

  bytes concatenatedEncryptedResourceDecryptionKeys;
uint256 concatenatedEncryptedResourceDecryptionKeysIndex;
bytes encryptedResourceDecryptionKey;
uint256 encryptedResourceDecryptionKeyIndex;

  function foo() public {
    
for(uint256 encryptedResourceDecryptionKeyIndex = 0; encryptedResourceDecryptionKeyIndex < encryptedResourceDecryptionKey.length; encryptedResourceDecryptionKeyIndex = (encryptedResourceDecryptionKeyIndex) + (1)){
require(concatenatedEncryptedResourceDecryptionKeysIndex < concatenatedEncryptedResourceDecryptionKeys.length);
encryptedResourceDecryptionKey[encryptedResourceDecryptionKeyIndex] = concatenatedEncryptedResourceDecryptionKeys[concatenatedEncryptedResourceDecryptionKeysIndex];
concatenatedEncryptedResourceDecryptionKeysIndex = (concatenatedEncryptedResourceDecryptionKeysIndex) + (1);
}


  }
}

//#LOOPVARS: encryptedResourceDecryptionKeyIndex








contract C {
  

  

  uint[] concatenatedEncryptedResourceDecryptionKeys;
uint[] encryptedResourceDecryptionKey;
uint256 concatenatedEncryptedResourceDecryptionKeysIndex;

  function foo() public {
    
for(uint256 encryptedResourceDecryptionKeyIndex = 0; encryptedResourceDecryptionKeyIndex < encryptedResourceDecryptionKey.length; encryptedResourceDecryptionKeyIndex = ((encryptedResourceDecryptionKeyIndex) + (1))){
require(concatenatedEncryptedResourceDecryptionKeysIndex < concatenatedEncryptedResourceDecryptionKeys.length);
encryptedResourceDecryptionKey[encryptedResourceDecryptionKeyIndex] = concatenatedEncryptedResourceDecryptionKeys[concatenatedEncryptedResourceDecryptionKeysIndex];
concatenatedEncryptedResourceDecryptionKeysIndex = ((concatenatedEncryptedResourceDecryptionKeysIndex) + (1));
}


  }

  

}

//#LOOPVARS: encryptedResourceDecryptionKeyIndex



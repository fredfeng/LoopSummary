
pragma solidity ^0.5.10;



contract C {
  

  uint256 resultIndex;
mapping(uint256 => address) collectibleIndexToOwner;
uint256 tokenIndex;
address _owner;
uint256 tokenId;
uint256[] tokens;
uint256 totalTokens;
uint256[] result;

  function foo() public {
    
for(tokenIndex = 0; tokenIndex < totalTokens; tokenIndex++){
tokenId = tokens[tokenIndex];
if (collectibleIndexToOwner[tokenId] == _owner) {
result[resultIndex] = tokenId;
resultIndex = (resultIndex) + (1);
}

}


  }
}

//#LOOPVARS: tokenIndex

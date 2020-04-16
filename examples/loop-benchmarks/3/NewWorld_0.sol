
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => address) collectibleIndexToOwner;
uint256 tokenIndex;
address _owner;
uint256 result;
uint256 tokenId;
uint256[] tokens;
uint256 totalTokens;

  function foo() public {
    
for(tokenIndex = 0; tokenIndex < totalTokens; tokenIndex++){
tokenId = tokens[tokenIndex];
if (collectibleIndexToOwner[tokenId] == _owner) {
result = (result) + (1);
}

}


  }
}

//#LOOPVARS: tokenIndex

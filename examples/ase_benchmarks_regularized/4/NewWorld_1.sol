






contract C {
  

  

  uint256 tokenId;
address _owner;
uint256[] result;
uint256 tokenIndex;
uint256 totalTokens;
mapping(uint256 => address) collectibleIndexToOwner;
uint256 resultIndex;
uint256[] tokens;

  function foo() public {
    
for(uint tokenIndex = 0; tokenIndex < totalTokens; tokenIndex++){
tokenId = tokens[tokenIndex];
if (collectibleIndexToOwner[tokenId] == _owner) {
result[resultIndex] = tokenId;
resultIndex = ((resultIndex) + (1));
}

}


  }

  

}

//#LOOPVARS: tokenIndex



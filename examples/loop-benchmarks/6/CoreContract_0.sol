
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => Token) tokenIndexToToken;
uint256 resultIndex;
uint256 _totalTokens;
uint256 tokenIndex;
bool exists;
address _owner;
uint256 tokenId;
uint256[] result;

  function foo() public {
    
while(tokenIndex <= _totalTokens){
if (exists(tokenId)) {
tokenIndex++;
if (tokenIndexToToken[tokenId].owner == _owner) {
result[resultIndex] = tokenId;
resultIndex++;
}

}

tokenId++;
}

  }
}

//#LOOPVARS: 

contract Token { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 _tokenCount;
mapping(address => uint256[]) ownedTokens;
uint256[] mintedAts;
uint256[] genes;
uint256[] kinds;
address _owner;
uint256 i;
uint256[] weights;
mapping(uint256 => Crystal) tokenIdToCrystal;
uint256[] tokenIds;

  function foo() public {
    
for(uint256 i = 0; i < _tokenCount; i++){
uint256 _tokenId = ownedTokens[_owner][i];
Crystal _crystal = tokenIdToCrystal[_tokenId];
tokenIds[i] = _tokenId;
genes[i] = _crystal.gene;
kinds[i] = _crystal.kind;
weights[i] = _crystal.weight;
mintedAts[i] = _crystal.mintedAt;
}


  }
}

//#LOOPVARS: i

contract Crystal { }


pragma solidity ^0.5.10;



contract C {
  

  uint256 _tokenCount;
mapping(address => uint256[]) ownedTokens;
uint256 index;
uint256[] mintedAts;
uint256[] genes;
address _owner;
uint256 i;
uint256[] weights;
mapping(uint256 => Crystal) tokenIdToCrystal;
uint256 _kind;
uint256[] tokenIds;

  function foo() public {
    
for(uint256 i = 0; i < _tokenCount; i++){
uint256 _tokenId = ownedTokens[_owner][i];
Crystal _crystal = tokenIdToCrystal[_tokenId];
if (_crystal.kind == _kind) {
tokenIds[index] = _tokenId;
genes[index] = _crystal.gene;
weights[index] = _crystal.weight;
mintedAts[i] = _crystal.mintedAt;
index = (index) + (1);
}

}


  }
}

//#LOOPVARS: i

contract Crystal { }

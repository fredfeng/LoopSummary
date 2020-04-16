
pragma solidity ^0.5.10;



contract C {
  

  uint256 _tokenCount;
mapping(address => uint256[]) ownedTokens;
address _owner;
uint256 i;
uint256[] amounts;
uint256[] weights;
mapping(uint256 => Crystal) tokenIdToCrystal;

  function foo() public {
    
for(uint256 i = 0; i < _tokenCount; i++){
uint256 _tokenId = ownedTokens[_owner][i];
Crystal _crystal = tokenIdToCrystal[_tokenId];
amounts[_crystal.kind] = (amounts[_crystal.kind]) + (1);
weights[_crystal.kind] = (weights[_crystal.kind]) + (_crystal.weight);
}


  }
}

//#LOOPVARS: i

contract Crystal { }


pragma solidity ^0.5.10;



contract C {
  

  address[] _owners;
uint256[] _parentIds;
bytes32[] _names;
uint256 id;
uint256[] _prices;
uint256[] _tokenIds;
bytes32[] _metadatas;

  function foo() public {
    
for(uint256 id = 0; id < _tokenIds.length; id++){
createToken(_tokenIds[id], _owners[id], _names[id], _parentIds[id], _prices[id], _metadatas[id]);
}


  }
}

//#LOOPVARS: id

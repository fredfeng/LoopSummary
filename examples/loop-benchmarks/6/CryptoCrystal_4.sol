
pragma solidity ^0.5.10;



contract C {
  

  uint256 _totalWeight;
uint256 _weight;
address _owner;
uint256 i;
uint256 _length;
uint256[] _tokenIds;
CrystalBaseIF crystal;
uint256[] _kinds;

  function foo() public {
    
for(uint256 i = 0; i < _length; i++){
require(crystal.ownerOf(_tokenIds[i]) == _owner);
(_kinds[i], _weight) = crystal.getCrystalKindWeight(_tokenIds[i]);
if (i != 0) {
require(_kinds[i] == _kinds[i - 1]);
}

_totalWeight = (_totalWeight) + (_weight);
crystal.burn(_owner, _tokenIds[i]);
}


  }
}

//#LOOPVARS: i

contract CrystalBaseIF { }

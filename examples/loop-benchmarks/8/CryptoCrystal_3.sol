
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _weights;
uint256 _crystalAmount;
uint256 _totalWeight;
uint256 estimatedWeight;
uint256 _weightRandomSum;
uint256 _weightSum;
address _owner;
uint256 i;
uint256[] _genes;
uint256[] _crystalWeightsCumsum;
uint256[] _tokenIds;
uint256[] crystalWeights;
uint256 _pkxAmount;
CrystalBaseIF crystal;
uint256[] _kinds;

  function foo() public {
    
for(i = 0; i < _crystalAmount; i++){
_kinds[i] = _getFirstIndex(_getRandom(_totalWeight), _crystalWeightsCumsum);
uint256 actualWeight = (estimatedWeight) * (_pkxAmount);
_weights[i] = ((_weights[i]) * (actualWeight)) / (_weightRandomSum);
_genes[i] = _generateGene();
require(_weights[i] > 0);
_tokenIds[i] = crystal.mint(_owner, _genes[i], _kinds[i], _weights[i]);
crystalWeights[_kinds[i]] = (crystalWeights[_kinds[i]]) - (_weights[i]);
_weightSum = (_weightSum) + (_weights[i]);
}


  }
}

//#LOOPVARS: i

contract CrystalBaseIF { }

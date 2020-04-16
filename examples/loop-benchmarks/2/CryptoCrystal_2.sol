
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _weights;
uint256 _crystalAmount;
uint256 _weightRandomSum;
uint256 i;

  function foo() public {
    
for(i = 0; i < _crystalAmount; i++){
_weights[i] = _getRandom(100);
_weightRandomSum = (_weightRandomSum) + (_weights[i]);
}


  }
}

//#LOOPVARS: i

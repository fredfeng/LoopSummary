
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _weights;
IMultiToken _mtkn;
uint i;

  function foo() public {
    
for(uint i = 0; i < _weights.length; i++){
_weights[i] = _mtkn.weights(_mtkn.tokens(i));
}


  }
}

//#LOOPVARS: i

contract IMultiToken { }

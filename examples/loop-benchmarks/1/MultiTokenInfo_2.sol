
pragma solidity ^0.5.10;



contract C {
  

  uint8[] _decimals;
uint i;
IBasicMultiToken _mtkn;

  function foo() public {
    
for(uint i = 0; i < _decimals.length; i++){
_decimals[i] = DetailedERC20(_mtkn.tokens(i)).decimals();
}


  }
}

//#LOOPVARS: i

contract IBasicMultiToken { }


pragma solidity ^0.5.10;



contract C {
  

  uint256[] _balances;
uint i;
IBasicMultiToken _mtkn;

  function foo() public {
    
for(uint i = 0; i < _balances.length; i++){
_balances[i] = _mtkn.tokens(i).balanceOf(_mtkn);
}


  }
}

//#LOOPVARS: i

contract IBasicMultiToken { }

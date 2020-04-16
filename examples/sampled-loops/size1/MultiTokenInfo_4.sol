
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _symbols;
uint i;
IBasicMultiToken _mtkn;

  function foo() public {
    
for(uint i = 0; i < _symbols.length; i++){
_symbols[i] = DetailedERC20(_mtkn.tokens(i)).asmSymbol();
}


  }
}

//#LOOPVARS: i

contract IBasicMultiToken { }

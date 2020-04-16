
pragma solidity ^0.5.10;



contract C {
  

  uint i;
ERC20[] _tokens;
IBasicMultiToken _mtkn;

  function foo() public {
    
for(uint i = 0; i < _tokens.length; i++){
_tokens[i] = _mtkn.tokens(i);
}


  }
}

//#LOOPVARS: i

contract IBasicMultiToken { }

contract ERC20 { }

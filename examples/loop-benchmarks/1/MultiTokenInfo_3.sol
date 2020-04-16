
pragma solidity ^0.5.10;



contract C {
  

  bytes32[] _names;
uint i;
IBasicMultiToken _mtkn;

  function foo() public {
    
for(uint i = 0; i < _names.length; i++){
_names[i] = DetailedERC20(_mtkn.tokens(i)).asmName();
}


  }
}

//#LOOPVARS: i

contract IBasicMultiToken { }

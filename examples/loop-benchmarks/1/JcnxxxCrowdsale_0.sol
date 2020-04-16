
pragma solidity ^0.5.10;



contract C {
  

  address[] _to;
ERC20 token;
uint8 i;
uint256[] _value;

  function foo() public {
    
for(uint8 i = 0; i < _to.length; i++){
require(MintableToken(token).mint(_to[i], ((_value[i]) * ((10 ** uint256(18))))) == true);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

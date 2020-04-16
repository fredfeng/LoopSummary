
pragma solidity ^0.5.10;



contract C {
  

  uint cnt;
uint256 _value;
address[] _tokens;
uint j;

  function foo() public {
    
for(uint j = 0; j < _tokens.length; j++){
ERC20Basic token = ERC20Basic(_tokens[j]);
uint256 value = (_value) * (10 ** uint256(token.decimals()));
uint256 amount = (uint256(cnt)) * (value);
require(value > 0 && token.balanceOf(this) >= amount);
for (uint i = 0; i < cnt; i++) {
token.transfer(_receivers[i], value);
}

}


  }
}

//#LOOPVARS: j

contract ERC20Basic { }

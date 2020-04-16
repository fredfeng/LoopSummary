
pragma solidity ^0.5.10;



contract C {
  

  address[] _investors;
uint decimalsForCalc;
uint256[] _tokenAmounts;
ERC20BasicInterface token;
uint i;

  function foo() public {
    
for(uint i = 0; i < _investors.length; i++){
require(_tokenAmounts[i] > 0 && _investors[i] != 0x0);
_tokenAmounts[i] = (_tokenAmounts[i]) * (decimalsForCalc);
require(token.transfer(_investors[i], _tokenAmounts[i]));
}


  }
}

//#LOOPVARS: i

contract ERC20BasicInterface { }

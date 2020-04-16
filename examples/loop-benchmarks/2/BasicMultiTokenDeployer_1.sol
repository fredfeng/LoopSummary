
pragma solidity ^0.5.10;



contract C {
  

  uint256[] tokenAmounts;
uint i;
ERC20[] _tokens;

  function foo() public {
    
for(uint i = 0; i < _tokens.length; i++){
require(tokenAmounts[i] != 0, "Token amount should be non-zero");
_tokens[i].checkedTransferFrom(msg.sender, this, tokenAmounts[i]);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

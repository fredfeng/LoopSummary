
pragma solidity ^0.5.10;



contract C {
  

  uint256 totalSupply_;
ERC20[] _tokens;
uint256 amount;
uint256[] tokenAmounts;
uint i;

  function foo() public {
    
for(uint i = 0; i < _tokens.length; i++){
tokenAmounts[i] = ((_tokens[i].balanceOf(this)) * (amount)) / (totalSupply_);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }


pragma solidity ^0.5.10;



contract C {
  

  address owner;
address[] tokens;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < tokens.length; i++){
ERC20Basic token = ERC20Basic(tokens[i]);
uint256 balance = token.balanceOf(this);
token.transfer(owner, balance);
}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }

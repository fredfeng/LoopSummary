
pragma solidity ^0.5.10;



contract C {
  

  uint256 creationUnit_;
TokenInfo[] tokens;
uint256 i;
uint256 baseUnits;

  function foo() public {
    
for(uint256 i = 0; i < tokens.length; i++){
TokenInfo token = tokens[i];
ERC20 erc20 = ERC20(token.addr);
uint256 amount = ((baseUnits) / (creationUnit_)) * (token.quantity);
require(erc20.transferFrom(msg.sender, address(this), amount));
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract TokenInfo { }

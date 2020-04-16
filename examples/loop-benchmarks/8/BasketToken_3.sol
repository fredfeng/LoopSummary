
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
address[] tokensToSkip;
uint256 creationQuantity_;
TokenInfo[] tokens;
uint256 baseUnits;

  function foo() public {
    
for(uint8 i = 0; i < tokens.length; i++){
TokenInfo tokenInfo = tokens[i];
ERC20 erc20 = ERC20(tokenInfo.addr);
uint256 index;
bool ok;
(index, ok) = tokensToSkip.index(tokenInfo.addr);
if (ok) {
continue;
}

uint256 amount = ((baseUnits) / (creationQuantity_)) * (tokenInfo.tokenUnits);
require(erc20.transfer(msg.sender, amount));
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract TokenInfo { }

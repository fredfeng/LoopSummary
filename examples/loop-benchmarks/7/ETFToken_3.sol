
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 baseUnitsToRedeem;
TokenInfo[] tokens;
address[] tokensToSkip;

  function foo() public {
    
for(uint8 i = 0; i < tokens.length; i++){
TokenInfo tokenInfo = tokens[i];
ERC20 erc20 = ERC20(tokenInfo.addr);
uint index;
bool ok;
(index, ok) = tokensToSkip.index(tokenInfo.addr);
if (ok) {
continue;
}

transferUnderlyingTokensWhenRedeem(erc20, tokenInfo.tokenUnits, baseUnitsToRedeem);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract TokenInfo { }


pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256 baseUnitsToCreate;
TokenInfo[] tokens;

  function foo() public {
    
for(uint8 i = 0; i < tokens.length; i++){
TokenInfo tokenInfo = tokens[i];
ERC20 erc20 = ERC20(tokenInfo.addr);
transferUnderlyingTokensWhenCreate(erc20, tokenInfo.tokenUnits, baseUnitsToCreate);
}


  }
}

//#LOOPVARS: i

contract ERC20 { }

contract TokenInfo { }

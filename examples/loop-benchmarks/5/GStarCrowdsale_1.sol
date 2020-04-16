
pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
uint256 tokensReleasedAmount;
address[] contributors;
mapping(address => uint256) depositedTokens;

  function foo() public {
    
for(uint256 j = 0; j < contributors.length; j++){
uint256 tokensAmount = depositedTokens[contributors[j]];
if (tokensAmount > 0) {
super._deliverTokens(contributors[j], tokensAmount);
depositedTokens[contributors[j]] = 0;
tokensReleasedAmount = (tokensReleasedAmount) + (tokensAmount);
}

}


  }
}

//#LOOPVARS: j

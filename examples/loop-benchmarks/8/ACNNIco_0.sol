
pragma solidity ^0.5.10;



contract C {
  

  uint256 oldRate;
uint len;
mapping(address => uint256) claimedAirdropTokens;
uint256[] amounts;
MintableToken token;
uint256 newRate;
address[] users;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address to = users[i];
uint256 value = amounts[i];
uint256 oldTokens = (value) * (oldRate);
uint256 newTokens = (value) * (newRate);
uint256 tokensToAirdrop = (newTokens) - (oldTokens);
if (claimedAirdropTokens[to] == 0) {
claimedAirdropTokens[to] = tokensToAirdrop;
token.mint(to, tokensToAirdrop);
}

}


  }
}

//#LOOPVARS: i

contract MintableToken { }

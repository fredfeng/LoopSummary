
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) claimedAirdrop;
ERC20Basic token;
uint len;
uint256 bountyTokens;
uint256 claimedAirdropTokens;
address[] users;
uint256 amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < len; i++){
address to = users[i];
if (!claimedAirdrop[to]) {
claimedAirdropTokens = (claimedAirdropTokens) + (amount);
require(claimedAirdropTokens <= bountyTokens);
claimedAirdrop[to] = true;
token.mint(to, amount);
}

}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }

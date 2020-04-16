
pragma solidity ^0.5.10;



contract C {
  

  JulyAirdrop previousAirdrop;
address airdropWallet;
mapping(address => uint256) claimedAirdropTokens;
uint256[] amounts;
address[] remainingAirdropSurplusAddresses;
mapping(address => uint256) remainingAirdropSurplus;
address[] users;
AidCoin token;
uint i;

  function foo() public {
    
for(uint i = 0; i < users.length; i++){
address to = users[i];
uint256 value = (((amounts[i] * (10 ** 18))) * (125)) / (1000);
if (claimedAirdropTokens[to] == 0) {
claimedAirdropTokens[to] = value;
uint256 previousSurplus = previousAirdrop.remainingAirdropSurplus(to);
if (value > previousSurplus) {
value = (value) - (previousSurplus);
token.transferFrom(airdropWallet, to, value);
} else {
remainingAirdropSurplus[to] = (previousSurplus) - (value);
remainingAirdropSurplusAddresses.push(to);
}

}

}


  }
}

//#LOOPVARS: i

contract JulyAirdrop { }

contract AidCoin { }

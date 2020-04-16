
pragma solidity ^0.5.10;



contract C {
  

  address airdropWallet;
mapping(address => uint256) claimedAirdropTokens;
uint256[] amounts;
mapping(address => uint256) previousAirdropSurplus;
address[] remainingAirdropSurplusAddresses;
mapping(address => uint256) remainingAirdropSurplus;
address[] users;
AidCoin token;
uint i;

  function foo() public {
    
for(uint i = 0; i < users.length; i++){
address to = users[i];
uint256 value = (((amounts[i] * (10 ** 18))) * (75)) / (1000);
if (claimedAirdropTokens[to] == 0) {
claimedAirdropTokens[to] = value;
if (value > previousAirdropSurplus[to]) {
value = (value) - (previousAirdropSurplus[to]);
token.transferFrom(airdropWallet, to, value);
} else {
remainingAirdropSurplus[to] = (previousAirdropSurplus[to]) - (value);
remainingAirdropSurplusAddresses.push(to);
}

}

}


  }
}

//#LOOPVARS: i

contract AidCoin { }

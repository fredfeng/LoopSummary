
pragma solidity ^0.5.10;



contract C {
  

  uint _4percent;
uint256 lastIndex;
uint _6percent;
mapping(uint => address) addresses;
mapping(address => uint) contributionsEth;
mapping(address => uint) contributionsToken;
uint totalWei;
uint i;
uint totalTokens;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
address holder = addresses[i];
uint _rewardTokens = ((contributionsToken[holder]) * (_6percent)) / (totalTokens);
uint _rewardWei = ((contributionsEth[holder]) * (_4percent)) / (totalWei);
holder.transfer((_rewardTokens) + (_rewardWei));
}


  }
}

//#LOOPVARS: i

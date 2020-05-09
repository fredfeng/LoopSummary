






contract C {
  

  

  uint256[] priceOfTokenInUSD;
uint256 left;
uint256 raisedTokens;
uint256 valueInUSD;
uint256 rewardAmount;
uint256[] tokensInTranch;

  function foo() public {
    
for(uint8 i = 0; i < tokensInTranch.length; i++){
if (tokensInTranch[i] >= raisedTokens) {
uint256 tokensPerEth = ((valueInUSD) / (priceOfTokenInUSD[i]));
uint256 tokensLeft = ((tokensPerEth) * (left));
if ((((raisedTokens) + (tokensLeft))) <= tokensInTranch[i]) {
rewardAmount = ((rewardAmount) + (tokensLeft));
left = 0;
break;
} else {
uint256 toNext = ((tokensInTranch[i]) - (raisedTokens));
uint256 WeiCost = ((toNext) / (tokensPerEth));
rewardAmount = ((rewardAmount) + (toNext));
raisedTokens = ((raisedTokens) + (toNext));
left = ((left) - (WeiCost));
}

}

}


  }

  

}

//#LOOPVARS: i



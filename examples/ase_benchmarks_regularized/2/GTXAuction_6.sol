






contract C {
  

  

  uint256[] bonusThresholdWei;
mapping(address => uint256) bids;
address _receiver;
uint256 bonusTokens;
mapping(address => uint256) bidTokens;
uint256[] bonusPercent;

  function foo() public {
    
for(uint256 i = 0; i < bonusThresholdWei.length; i++){
if (bids[_receiver] >= bonusThresholdWei[i]) {
bonusTokens = ((((bonusPercent[i]) * (bidTokens[_receiver]))) / (100));
}

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  uint256 totalFreezeTokens;
address[] sender;
uint256[] amount;
mapping(address => uint256) freezeTokens;
uint256[] blockTime;
mapping(address => uint256) freezeTimeBlock;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
totalFreezeTokens = ((totalFreezeTokens) + (amount[i]));
freezeTokens[sender[i]] = amount[i];
freezeTimeBlock[sender[i]] = blockTime[i];
}


  }

  

}

//#LOOPVARS: i



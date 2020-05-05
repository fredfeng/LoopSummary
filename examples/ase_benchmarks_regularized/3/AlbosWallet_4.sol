






contract C {
  

  

  address[] sender;
mapping(address => uint256) freezeTimeBlock;
uint256[] amount;
uint256 totalFreezeTokens;
mapping(address => uint256) freezeTokens;
uint256[] blockTime;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
totalFreezeTokens = ((totalFreezeTokens) + (amount[i]));
freezeTokens[sender[i]] = amount[i];
freezeTimeBlock[sender[i]] = blockTime[i];
}


  }

  

}

//#LOOPVARS: i



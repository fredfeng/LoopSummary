
pragma solidity ^0.5.10;



contract C {
  

  address[] sender;
mapping(address => uint256) freezeTokens;
mapping(address => uint256) freezeTimeBlock;
uint256[] amount;
uint256[] blockTime;
uint256 totalFreezeTokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
totalFreezeTokens = (totalFreezeTokens) + (amount[i]);
freezeTokens[sender[i]] = amount[i];
freezeTimeBlock[sender[i]] = blockTime[i];
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) uniqueTokens;
address[] sender;
mapping(address => uint256) balances;
uint256[] amount;
uint i;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
uniqueTokens[sender[i]] = (uniqueTokens[sender[i]]) + (amount[i]);
balances[address(this)] = (balances[address(this)]) - (amount[i]);
balances[sender[i]] = (balances[sender[i]]) + (amount[i]);
emit Transfer(address(this), sender[i], amount[i]);
}


  }
}

//#LOOPVARS: i

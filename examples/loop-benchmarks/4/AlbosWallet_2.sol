
pragma solidity ^0.5.10;



contract C {
  

  address[] sender;
mapping(address => uint256) balances;
uint256[] amount;
mapping(address => uint256) preSaleTokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
preSaleTokens[sender[i]] = (preSaleTokens[sender[i]]) + (amount[i]);
balances[address(this)] = (balances[address(this)]) - (amount[i]);
balances[sender[i]] = (balances[sender[i]]) + (amount[i]);
emit Transfer(address(this), sender[i], amount[i]);
}


  }
}

//#LOOPVARS: i

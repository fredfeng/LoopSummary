
pragma solidity ^0.5.10;



contract C {
  

  uint256[] amount;
address[] sender;
uint i;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < sender.length; i++){
balances[address(this)] = (balances[address(this)]) - (amount[i]);
balances[sender[i]] = (balances[sender[i]]) + (amount[i]);
emit Transfer(address(this), sender[i], amount[i]);
}


  }
}

//#LOOPVARS: i

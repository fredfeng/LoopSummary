
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256[] values;
address[] recipients;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < recipients.length; i++){
require(balances[msg.sender] >= values[i]);
require(recipients[i] != address(0));
balances[msg.sender] = (balances[msg.sender]) - (values[i]);
balances[recipients[i]] = (balances[recipients[i]]) + (values[i]);
emit Transfer(msg.sender, recipients[i], values[i]);
}


  }
}

//#LOOPVARS: i

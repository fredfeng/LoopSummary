
pragma solidity ^0.5.10;



contract C {
  

  uint8 decimals;
uint ui;
address to;
address[] a_receiver;
uint value;
uint[] a_values;
mapping(address => uint256) _balances;
uint receiverLength;

  function foo() public {
    
for(uint ui = 0; ui < receiverLength; ui++){
to = a_receiver[ui];
value = (a_values[ui]) * (10 ** uint(decimals));
require(_balances[msg.sender] >= value);
_balances[msg.sender] = (_balances[msg.sender]) - (value);
_balances[to] = (_balances[to]) + (value);
}


  }
}

//#LOOPVARS: ui

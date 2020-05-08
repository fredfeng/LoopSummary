






contract C {
  

  

  address to;
uint receiverLength;
address[] a_receiver;
uint[] a_values;
uint value;
mapping(address => uint256) _balances;
uint8 decimals;

  function foo() public {
    
for(uint ui = 0; ui < receiverLength; ui++){
to = a_receiver[ui];
value = ((a_values[ui]) * (10 ** uint(decimals)));
require(_balances[msg.sender] >= value);
_balances[msg.sender] = ((_balances[msg.sender]) - (value));
_balances[to] = ((_balances[to]) + (value));
}


  }

  

}

//#LOOPVARS: ui



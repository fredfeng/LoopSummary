
pragma solidity ^0.5.10;



contract C {
  

  address[] _recipients;
uint[] _values;
mapping(address => uint256) balances;
uint j;

  function foo() public {
    
for(uint j = 0; j < _recipients.length; j++){
balances[_recipients[j]] = (balances[_recipients[j]]) + (_values[j]);
emit Transfer(msg.sender, _recipients[j], _values[j]);
}


  }
}

//#LOOPVARS: j

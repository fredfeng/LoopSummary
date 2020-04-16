
pragma solidity ^0.5.10;



contract C {
  

  uint[] _values;
address _from;
mapping(address => uint256) balances;
address[] _recipients;
uint j;

  function foo() public {
    
for(uint j = 0; j < _recipients.length; j++){
balances[_recipients[j]] = (balances[_recipients[j]]) + (_values[j]);
Transfer(_from, _recipients[j], _values[j]);
}


  }
}

//#LOOPVARS: j

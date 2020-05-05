






contract C {
  

  

  uint[] _values;
address[] _recipients;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint j = 0; j < _recipients.length; j++){
balances[_recipients[j]] = ((balances[_recipients[j]]) + (_values[j]));

}


  }

  

}

//#LOOPVARS: j



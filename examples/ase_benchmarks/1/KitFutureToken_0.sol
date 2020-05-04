






contract C {
  

  

  uint256[] _amounts;
address[] _recipients;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _recipients.length; i++){
balances[_recipients[i]] = ((balances[_recipients[i]]) + (_amounts[i]));

}


  }

  

}

//#LOOPVARS: i



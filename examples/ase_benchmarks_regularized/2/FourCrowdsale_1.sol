






contract C {
  

  

  address[] _tos;
uint256[] _values;
mapping(address => uint256) balances;
address _from;

  function foo() public {
    
for(uint i; i < _tos.length; i++){
balances[_from] = ((balances[_from]) - (_values[i]));
balances[_tos[i]] = ((balances[_tos[i]]) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i



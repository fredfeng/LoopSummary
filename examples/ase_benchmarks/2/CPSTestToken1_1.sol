






contract C {
  

  

  address[] _tos;
uint i;
uint count;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(i = 0; i < count; i++){
balances[msg.sender] = ((balances[msg.sender]) - (_values[i]));
balances[_tos[i]] = ((balances[_tos[i]]) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i



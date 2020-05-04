






contract C {
  

  

  address[] _tos;
uint256 i;
mapping(address => bool) touched;
uint256 distributed;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(i = 0; i < _tos.length; i++){
distributed = ((distributed) + (_values[i]));
balances[_tos[i]] = ((balances[_tos[i]]) + (_values[i]));
touched[_tos[i]] = true;

}


  }

  

}

//#LOOPVARS: i



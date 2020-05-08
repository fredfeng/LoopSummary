






contract C {
  

  

  address[] _owners;
address from;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 i = 0; i < _owners.length; i++){
address to = _owners[i];
uint256 value = _values[i];
require(value <= balances[from]);
balances[to] = ((balances[to]) + (value));
balances[from] = ((balances[from]) - (value));

}


  }

  

}

//#LOOPVARS: i



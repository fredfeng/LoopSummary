






contract C {
  

  

  address[] _owners;
uint decimals;
uint256 totalSupply;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _owners.length; i++){
uint256 value = _values[i] * 10 ** decimals;
totalSupply = ((totalSupply) + (value));
balances[_owners[i]] = ((balances[_owners[i]]) + (value));

}


  }

  

}

//#LOOPVARS: i



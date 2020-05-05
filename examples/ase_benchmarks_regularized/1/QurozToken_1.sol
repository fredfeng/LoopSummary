






contract C {
  

  

  address[] _to;
uint256 i;
uint256[] _amount;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _to.length; i++){
balances[_to[i]] = ((balances[_to[i]]) + (_amount[i]));

}


  }

  

}

//#LOOPVARS: i



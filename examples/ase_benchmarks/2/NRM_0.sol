






contract C {
  

  

  address[] to;
mapping(address => uint) balances;
address owner;
uint256[] values;

  function foo() public {
    
for(uint256 i = 0; i < to.length; i++){
balances[owner] = ((balances[owner]) - (values[i]));
balances[to[i]] = ((balances[to[i]]) + (values[i]));

}


  }

  

}

//#LOOPVARS: i



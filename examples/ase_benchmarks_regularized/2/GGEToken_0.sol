






contract C {
  

  

  uint256[] _value;
address[] _addr;
address owner;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 i = 0; i < _addr.length; i++){
balances[owner] = ((balances[owner]) - (_value[i]));
balances[_addr[i]] = ((balances[_addr[i]]) + (_value[i]));

}


  }

  

}

//#LOOPVARS: i



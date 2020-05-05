






contract C {
  

  

  address[] _receivers;
uint _count;
uint256 _value;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < _count; i++){
balances[_receivers[i]] = ((balances[_receivers[i]]) + (_value));

}


  }

  

}

//#LOOPVARS: i



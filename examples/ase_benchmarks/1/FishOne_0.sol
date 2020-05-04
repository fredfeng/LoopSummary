






contract C {
  

  

  address[] _receivers;
uint cnt;
uint256 _value;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
balances[_receivers[i]] = ((balances[_receivers[i]]) + (_value));

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  address[] _receivers;
mapping(address => uint) balances;
uint cnt;
uint256 _value;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
balances[_receivers[i]] = ((balances[_receivers[i]]) + (_value));

}


  }

  

}

//#LOOPVARS: i



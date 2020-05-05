






contract C {
  

  

  uint256[] _value;
address[] _investors;
uint256 amount;
mapping(address => uint256) balances;
uint8 cnt;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
amount = ((amount) + (_value[i]));
require(_investors[i] != address(0));
balances[_investors[i]] = ((balances[_investors[i]]) + (_value[i]));

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  address[] _receivers;
uint[] _values;
uint cnt;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
address _to = _receivers[i];
uint _value = _values[i];
require(_to != address(0) && _value <= balances[msg.sender]);
balances[msg.sender] = ((balances[msg.sender]) - (_values[i]));
balances[_to] = ((balances[_to]) + (_values[i]));

}


  }

  

}

//#LOOPVARS: i



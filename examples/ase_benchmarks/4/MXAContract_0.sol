






contract C {
  

  

  address[] _receivers;
uint _value;
uint cnt;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint i = 0; i < cnt; i++){
address _to = _receivers[i];
require(_to != address(0) && _value <= balances[msg.sender]);
balances[msg.sender] = ((balances[msg.sender]) - (_value));
balances[_to] = ((balances[_to]) + (_value));

}


  }

  

}

//#LOOPVARS: i



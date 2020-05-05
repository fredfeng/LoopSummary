






contract C {
  

  

  address[] _tos;
uint256 len;
uint256[] _values;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 j = 0; j < len; j = ((j) + (1))){
address _to = _tos[j];
require(_to != address(0));
balances[_to] = ((balances[_to]) + (_values[j]));
balances[msg.sender] = ((balances[msg.sender]) - (_values[j]));

}


  }

  

}

//#LOOPVARS: j



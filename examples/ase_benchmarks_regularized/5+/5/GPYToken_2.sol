






contract C {
  

  

  uint256[] _amounts;
uint256 len;
address[] _targets;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 j = 0; j < len; j = ((j) + (1))){
address _target = _targets[j];
uint256 _amount = _amounts[j];
require(_target != address(0));
balances[_target] = ((balances[_target]) + (_amount));
balances[msg.sender] = ((balances[msg.sender]) - (_amount));

}


  }

  

}

//#LOOPVARS: j



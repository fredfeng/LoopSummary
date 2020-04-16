
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) balances;
uint256 j;
uint256 len;
address[] _targets;
uint256[] _amounts;

  function foo() public {
    
for(uint256 j = 0; j < len; j = (j) + (1)){
address _target = _targets[j];
uint256 _amount = _amounts[j];
require(_target != address(0));
balances[_target] = (balances[_target]) + (_amount);
balances[msg.sender] = (balances[msg.sender]) - (_amount);
emit Transfer(msg.sender, _target, _amount);
}


  }
}

//#LOOPVARS: j

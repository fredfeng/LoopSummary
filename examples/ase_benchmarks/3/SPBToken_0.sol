






contract C {
  

  

  uint256 len;
address[] _targets;
uint _timestamp;
mapping(address => uint256) frozenAccount;

  function foo() public {
    
for(uint256 i = 0; i < len; i = ((i) + (1))){
address _target = _targets[i];
require(_target != address(0));
frozenAccount[_target] = _timestamp;
}


  }

  

}

//#LOOPVARS: i



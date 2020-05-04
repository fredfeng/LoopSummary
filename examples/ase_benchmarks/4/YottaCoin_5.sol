






contract C {
  

  

  uint256 len;
uint256[] _timestamps;
address admin;
address[] _targets;
mapping(address => uint256) frozenTimestamp;

  function foo() public {
    
for(uint256 i = 0; i < len; i = ((i) + (1))){
address _target = _targets[i];
require(_target != admin);
uint256 _timestamp = _timestamps[i];
frozenTimestamp[_target] = _timestamp;
}


  }

  

}

//#LOOPVARS: i



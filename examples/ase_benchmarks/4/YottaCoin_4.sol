






contract C {
  

  

  bool[] _freezes;
uint256 len;
mapping(address => bool) frozenAccount;
address admin;
address[] _targets;

  function foo() public {
    
for(uint256 i = 0; i < len; i = ((i) + (1))){
address _target = _targets[i];
require(_target != admin);
bool _freeze = _freezes[i];
frozenAccount[_target] = _freeze;
}


  }

  

}

//#LOOPVARS: i



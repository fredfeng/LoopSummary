






contract C {
  

  

  mapping(address => bool) frozenAccount;
mapping(address => uint256) balanceOf;
address[] _targets;

  function foo() public {
    
for(uint j = 0; j < _targets.length; j++){
require(_targets[j] != 0x0);
frozenAccount[_targets[j]] = true;

}


  }

  

}

//#LOOPVARS: j



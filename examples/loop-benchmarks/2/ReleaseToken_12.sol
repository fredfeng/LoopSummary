
pragma solidity ^0.5.10;



contract C {
  

  address[] _dests;
address[] _targets;
uint256 i;

  function foo() public {
    
while(i < _targets.length){
if (!releaseWithStage(_targets[i], _dests[i])) {
return false;
}

i = (i) + (1);
}

  }
}

//#LOOPVARS: 

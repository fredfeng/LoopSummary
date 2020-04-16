
pragma solidity ^0.5.10;



contract C {
  

  address[] _targets;
bool res;
address _tk;
uint256 i;

  function foo() public {
    
while(i < _targets.length){
res = releaseWithStage(_targets[i], _tk) || res;
i = (i) + (1);
}

  }
}

//#LOOPVARS: 

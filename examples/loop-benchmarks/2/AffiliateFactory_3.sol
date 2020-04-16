
pragma solidity ^0.5.10;



contract C {
  

  address[] _stakeHolders;
uint i;
uint256[] _stakes;
uint256 stakesTotal;

  function foo() public {
    
for(uint i = 0; i < _stakeHolders.length; i++){
require(_stakes[i] > 0);
stakesTotal = SafeMath.add(stakesTotal, _stakes[i]);
}


  }
}

//#LOOPVARS: i

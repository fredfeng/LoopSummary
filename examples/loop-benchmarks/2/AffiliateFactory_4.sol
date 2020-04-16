
pragma solidity ^0.5.10;



contract C {
  

  uint[] shares;
address[] stakeHolders;
address[] _stakeHolders;
uint256[] _stakes;
uint senderStake;
uint256 stakesTotal;
uint i;

  function foo() public {
    
for(i = 0; i < _stakeHolders.length; i++){
stakeHolders[i + 1] = _stakeHolders[i];
shares[i + 1] = SafeMath.mul(_stakes[i], senderStake) / stakesTotal;
}


  }
}

//#LOOPVARS: i

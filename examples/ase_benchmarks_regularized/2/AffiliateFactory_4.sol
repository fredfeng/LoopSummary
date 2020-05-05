






contract C {
  

  

  address[] stakeHolders;
uint[] shares;
address[] _stakeHolders;
uint256 stakesTotal;
uint i;
uint256[] _stakes;
uint senderStake;

  function foo() public {
    
for(uint i = 0; i < _stakeHolders.length; i++){
stakeHolders[i + 1] = _stakeHolders[i];
shares[i + 1] = ((_stakes[i]) * (senderStake)) / stakesTotal;
}


  }

  

}

//#LOOPVARS: i



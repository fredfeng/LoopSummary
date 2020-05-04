






contract C {
  

  

  uint256[] _rewards;
uint256 i;
uint256 _totalReward;
address[] _beneficiaries;

  function foo() public {
    
for(i = 0; i < _rewards.length; i++){
_totalReward = ((_totalReward) + (_rewards[i]));

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  address[] _stakeHolders;
uint256 stakesTotal;
uint256[] _stakes;

  function foo() public {
    
for(uint i = 0; i < _stakeHolders.length; i++){
require(_stakes[i] > 0);
stakesTotal = ((stakesTotal) + (_stakes[i]));
}


  }

  

}

//#LOOPVARS: i



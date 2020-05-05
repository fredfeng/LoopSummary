






contract C {
  

  

  uint256[] bonusPercent;
uint256[] bonusThreshold;
uint256[] _bonusPercent;
uint256[] _bonusThreshold;

  function foo() public {
    
for(uint256 i = 0; i < _bonusThreshold.length; i++){
bonusThreshold[i] = _bonusThreshold[i];
bonusPercent[i] = _bonusPercent[i];
}


  }

  

}

//#LOOPVARS: i



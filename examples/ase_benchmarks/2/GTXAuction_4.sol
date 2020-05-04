






contract C {
  

  

  uint256[] bonusThresholdWei;
uint256[] bonusPercent;
uint256 WEI_FACTOR;
uint256[] _bonusPercent;
uint256 _etherPrice;
uint256[] _bonusThreshold;

  function foo() public {
    
for(uint32 i = 0; i < _bonusPercent.length; i++){
bonusPercent[i] = _bonusPercent[i];
bonusThresholdWei[i] = ((((_bonusThreshold[i]) * (WEI_FACTOR))) / (_etherPrice));
}


  }

  

}

//#LOOPVARS: i



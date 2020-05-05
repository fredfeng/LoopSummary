






contract C {
  

  

  uint256 gtxTokens;
uint256 bonus;
uint256[] bonusThreshold;
uint256[] bonusPercent;

  function foo() public {
    
for(uint256 i = 0; i < bonusThreshold.length; i++){
if (gtxTokens >= bonusThreshold[i]) {
bonus = (((((bonusPercent[i]) * (gtxTokens)))) / (100));
}

}


  }

  

}

//#LOOPVARS: i



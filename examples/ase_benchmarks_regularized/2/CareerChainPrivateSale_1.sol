






contract C {
  

  

  uint256 i;
uint256[] lockupEndTime;
uint256 lockupStage;

  function foo() public {
    
while(i < lockupEndTime.length && lockupEndTime[i] <= now){
lockupStage = ((lockupStage) + (1));
i = ((i) + (1));
}

  }

  

}

//#LOOPVARS: i



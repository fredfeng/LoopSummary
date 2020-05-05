






contract C {
  

  

  uint256 i;
uint256[] trimLockTime;
uint256 j;
uint256[] trimLockValue;
uint256[] newLockValue;
uint256[] newLockTime;

  function foo() public {
    
while(i < j){
trimLockTime[i] = newLockTime[i];
trimLockValue[i] = newLockValue[i];
i++;
}

  }

  

}

//#LOOPVARS: i



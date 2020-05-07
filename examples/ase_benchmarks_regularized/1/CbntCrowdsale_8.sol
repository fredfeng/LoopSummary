






contract C {
uint256 now;  

  

  uint256 i;
uint32[] regularTransTime;

  function foo() public {
    
while(i < regularTransTime.length && now >= regularTransTime[i]){
i++;
}

  }

  

}

//#LOOPVARS: i










contract C {
  

  

  uint8 roundNum;
uint256 totalSupply;
uint256[] roundCaps;

  function foo() public {
    
while(roundNum < 4 && totalSupply > roundCaps[roundNum]){
roundNum++;
}

  }

  

}

//#LOOPVARS: i










contract C {
  

  

  uint256[] stageCaps;
uint256 totalSupply;
uint8 stageNumber;

  function foo() public {
    
while(stageNumber < 24 && totalSupply > stageCaps[stageNumber]){
stageNumber++;
}

  }

  

}

//#LOOPVARS: i



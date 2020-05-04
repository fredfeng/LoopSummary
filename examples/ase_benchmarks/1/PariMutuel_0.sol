






contract C {
  

  

  uint8 numberOfOutcomes;
uint256 total;
mapping(uint8 => uint256) totalForOutcome;

  function foo() public {
    
for(uint8 i = 0; i < numberOfOutcomes; i++){
total = ((total) + (totalForOutcome[i]));
}


  }

  

}

//#LOOPVARS: i



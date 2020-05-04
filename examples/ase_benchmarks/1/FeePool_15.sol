






contract C {
  

  

  uint totalFees;
uint8 FEE_PERIOD_LENGTH;
uint[] userFees;

  function foo() public {
    
for(uint i = 1; i < FEE_PERIOD_LENGTH; i++){
totalFees = ((totalFees) + (userFees[i]));
}


  }

  

}

//#LOOPVARS: i



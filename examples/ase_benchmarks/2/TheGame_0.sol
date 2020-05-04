






contract C {
  

  

  uint256 output;
uint256 m_interestRateNumerator;
uint256 INTEREST_RATE_DENOMINATOR;
uint256 counter;

  function foo() public {
    
while(counter > 0){
output = ((output) + (((((output) * (m_interestRateNumerator))) / (INTEREST_RATE_DENOMINATOR))));
counter = ((counter) - (1));
}

  }

  

}

//#LOOPVARS: i










contract C {
  

  

  uint256 dividendsSum;
uint256[] dividends;

  function foo() public {
    
for(uint i = 0; i < dividends.length; i++){
dividendsSum = ((dividendsSum) + (dividends[i]));
}


  }

  

}

//#LOOPVARS: i



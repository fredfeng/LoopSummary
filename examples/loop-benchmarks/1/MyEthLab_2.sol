
pragma solidity ^0.5.10;



contract C {
  

  uint256[] dividends;
uint256 dividendsSum;
uint i;

  function foo() public {
    
for(uint i = 0; i < dividends.length; i++){
dividendsSum = (dividendsSum) + (dividends[i]);
}


  }
}

//#LOOPVARS: i

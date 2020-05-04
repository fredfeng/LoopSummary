






contract C {
  

  

  uint256 j;
address[] topWinners;

  function foo() public {
    
for(uint256 k = j; k < 10; k++){
topWinners[k] = topWinners[k + 1];
}


  }

  

}

//#LOOPVARS: k



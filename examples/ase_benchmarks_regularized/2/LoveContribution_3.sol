






contract C {
  

  

  uint256 weiRaised;
uint256 mulFactor;
uint256 len;
address[] topWinners;
mapping(address => uint256) amountWon;

  function foo() public {
    
for(uint256 num = 0; num < 10 && num < len; num++){
amountWon[topWinners[num]] = (((((weiRaised) / (1000)))) * (mulFactor));
mulFactor = ((mulFactor) - (5));
}


  }

  

}

//#LOOPVARS: num



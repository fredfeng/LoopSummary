
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) amountWon;
uint256 mulFactor;
uint256 len;
uint256 num;
address[] topWinners;
uint256 weiRaised;

  function foo() public {
    
for(uint256 num = 0; num < 10 && num < len; num++){
amountWon[topWinners[num]] = (((weiRaised) / (1000))) * (mulFactor);
mulFactor = (mulFactor) - (5);
}


  }
}

//#LOOPVARS: num

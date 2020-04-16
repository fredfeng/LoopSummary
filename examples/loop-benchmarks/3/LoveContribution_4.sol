
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) amountWon;
address[] randomWinners;
uint256 len;
uint256 num;
address[] contributors;
uint256 weiRaised;

  function foo() public {
    
for(num = 0; num < 20 && num < len; num++){
if (amountWon[contributors[num]] <= 0) {
randomWinners.push(contributors[num]);
amountWon[contributors[num]] = (((weiRaised) / (1000))) * (3);
}

}


  }
}

//#LOOPVARS: num


pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) amountWon;
uint256 j;
address[] randomWinners;
uint256 len;
uint256 randomNo;
address[] contributors;
uint256 weiRaised;

  function foo() public {
    
for(uint256 j = 0; j < len; j++){
randomNo = ((randomNo) + (1)) % len;
if (amountWon[contributors[randomNo]] <= 0) {
randomWinners.push(contributors[randomNo]);
amountWon[contributors[randomNo]] = (((weiRaised) / (1000))) * (3);
break;
}

}


  }
}

//#LOOPVARS: j

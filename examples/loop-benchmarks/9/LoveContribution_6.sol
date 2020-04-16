
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) amountWon;
address[] randomWinners;
uint256 len;
uint256 i;
address[] contributors;
uint256 weiRaised;

  function foo() public {
    
for(uint256 i = 0; i < 10; i++){
uint256 randomNo = random(i + 1) % len;
if (amountWon[contributors[randomNo]] <= 0) {
randomWinners.push(contributors[randomNo]);
amountWon[contributors[randomNo]] = (((weiRaised) / (1000))) * (3);
} else {
for (uint256 j = 0; j < len; j++) {
randomNo = (randomNo.add(1)) % len;
if (amountWon[contributors[randomNo]] <= 0) {
randomWinners.push(contributors[randomNo]);
amountWon[contributors[randomNo]] = (((weiRaised) / (1000))) * (3);
break;
}

}

}

}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  uint256 j;
address[] topWinners;
uint256 i;

  function foo() public {
    
for(uint256 j = 10; j > i; j--){
if (topWinners[j - 1] != msg.sender) {
topWinners[j] = topWinners[j - 1];
} else {
for (uint256 k = j; k < 10; k++) {
topWinners[k] = topWinners[k + 1];
}

}

}


  }
}

//#LOOPVARS: j

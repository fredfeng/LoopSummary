






contract C {
  

  

  uint256 k;
uint256 i;
address[] topWinners;

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



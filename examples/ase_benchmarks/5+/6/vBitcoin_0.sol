






contract C {
  

  

  uint blockPassed;
uint blockBeforeChange;
uint blockProfit;
uint _totalMined;

  function foo() public {
    
while(blockPassed > 0){
if (blockPassed > blockBeforeChange) {
_totalMined = ((_totalMined) + (((blockBeforeChange) * (blockProfit))));
blockProfit = ((blockProfit) / (2));
blockPassed = ((blockPassed) - (blockBeforeChange));
} else {
_totalMined = ((_totalMined) + (((blockPassed) * (blockProfit))));
blockPassed = 0;
}

}

  }

  

}

//#LOOPVARS: i



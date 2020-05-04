






contract C {
  

  

  uint256 rate;
uint256 i;
uint256[] stages;
uint256 initialRate;
uint256[] bonuses;

  function foo() public {
    
while(i-- > 0){
if (block.timestamp >= stages[i]) {
rate = ((initialRate) + (((((initialRate) * (bonuses[i]))) / (100))));

break;
}

}

  }

  

}

//#LOOPVARS: i



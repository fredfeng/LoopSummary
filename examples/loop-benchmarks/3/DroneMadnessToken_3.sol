
pragma solidity ^0.5.10;



contract C {
  

  uint256[] bonuses;
uint256[] stages;
uint256 rate;
uint256 i;
uint256 initialRate;

  function foo() public {
    
while(i-- > 0){
if (block.timestamp >= stages[i]) {
rate = (initialRate) + (((initialRate) * (bonuses[i])) / (100));
emit CurrentRateChange(rate);
break;
}

}

  }
}

//#LOOPVARS: 

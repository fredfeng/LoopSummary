
pragma solidity ^0.5.10;



contract C {
  

  uint256 _profitPercentageEminus7Multi;
profitDay[] profitDays;
uint16 currentProfitDay;
uint16 i;
uint total_value;
uint16 _option;

  function foo() public {
    
for(i; i < currentProfitDay + _option; i++){
if (profitDays[i].dailyProfit > 0) {
total_value = (total_value) + ((profitDays[i].dailyProfit / 10000000 * _profitPercentageEminus7Multi));
}

}


  }
}

//#LOOPVARS: 

contract profitDay { }

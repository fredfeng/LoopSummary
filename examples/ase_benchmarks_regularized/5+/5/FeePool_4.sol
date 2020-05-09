






contract C {
  

  

  mapping(bytes4 => uint) rates;
uint[] newRates;
bytes4[] currencyKeys;
uint timeSent;
mapping(bytes4 => uint) lastRateUpdateTimes;

  function foo() public {
    
for(uint i = 0; i < currencyKeys.length; i++){
require(newRates[i] != 0, "Zero is not a valid rate, please call deleteRate instead.");
require(currencyKeys[i] != "sUSD", "Rate of sUSD cannot be updated, it's always UNIT.");
if (timeSent >= lastRateUpdateTimes[currencyKeys[i]]) {
rates[currencyKeys[i]] = newRates[i];
lastRateUpdateTimes[currencyKeys[i]] = timeSent;
}

}


  }

  

}

//#LOOPVARS: i



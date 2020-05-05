






contract C {
  

  

  bytes4[] currencyKeys;
uint[] lastUpdateTimes;
mapping(bytes4 => uint) lastRateUpdateTimes;

  function foo() public {
    
for(uint8 i = 0; i < currencyKeys.length; i++){
lastUpdateTimes[i] = lastRateUpdateTimes[currencyKeys[i]];
}


  }

  

}

//#LOOPVARS: i



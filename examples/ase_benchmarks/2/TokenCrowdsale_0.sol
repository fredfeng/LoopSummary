






contract C {
  

  

  uint ethValue;
uint needTokens;
uint[] exchangeLevel;
uint[] exchangeRate;

  function foo() public {
    
for(uint i = 0; i < exchangeLevel.length; i++){
if (ethValue >= exchangeLevel[i]) {
needTokens = ((ethValue) * (exchangeRate[i]));
break;
}

}


  }

  

}

//#LOOPVARS: i



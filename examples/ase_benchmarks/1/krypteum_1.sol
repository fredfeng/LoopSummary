






contract C {
  

  

  uint[] numberOfCoinsAvailableInIcoTier;
uint totalAvailableIcoCoins;

  function foo() public {
    
for(uint8 i = 0; i < numberOfCoinsAvailableInIcoTier.length; i++){
totalAvailableIcoCoins = ((totalAvailableIcoCoins) + (numberOfCoinsAvailableInIcoTier[i]));
}


  }

  

}

//#LOOPVARS: i



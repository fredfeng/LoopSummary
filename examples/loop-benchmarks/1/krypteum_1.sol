
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint totalAvailableIcoCoins;
uint[] numberOfCoinsAvailableInIcoTier;

  function foo() public {
    
for(uint8 i = 0; i < numberOfCoinsAvailableInIcoTier.length; i++){
totalAvailableIcoCoins = (totalAvailableIcoCoins) + (numberOfCoinsAvailableInIcoTier[i]);
}


  }
}

//#LOOPVARS: i

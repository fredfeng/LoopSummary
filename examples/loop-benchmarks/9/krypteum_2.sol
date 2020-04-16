
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint[] costOfACoinInWeiForTier;
uint[] numberOfCoinsAvailableInIcoTier;
uint change;
uint coins;

  function foo() public {
    
for(uint8 i = 0; i < numberOfCoinsAvailableInIcoTier.length; i++){
uint costOfAvailableCoinsInCurrentTier = (numberOfCoinsAvailableInIcoTier[i]) * (costOfACoinInWeiForTier[i]);
if (change <= costOfAvailableCoinsInCurrentTier) {
uint coinsInCurrentTierToBuy = (change) / (costOfACoinInWeiForTier[i]);
coins = (coins) + (coinsInCurrentTierToBuy);
numberOfCoinsAvailableInIcoTier[i] = (numberOfCoinsAvailableInIcoTier[i]) - (coinsInCurrentTierToBuy);
change = 0;
break;
}

coins = (coins) + (numberOfCoinsAvailableInIcoTier[i]);
change = (change) - (costOfAvailableCoinsInCurrentTier);
numberOfCoinsAvailableInIcoTier[i] = 0;
}


  }
}

//#LOOPVARS: i

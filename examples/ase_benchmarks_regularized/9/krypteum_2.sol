






contract C {
  

  

  uint[] costOfACoinInWeiForTier;
uint coins;
uint[] numberOfCoinsAvailableInIcoTier;
uint change;

  function foo() public {
    
for(uint8 i = 0; i < numberOfCoinsAvailableInIcoTier.length; i++){
uint costOfAvailableCoinsInCurrentTier = ((numberOfCoinsAvailableInIcoTier[i]) * (costOfACoinInWeiForTier[i]));
if (change <= costOfAvailableCoinsInCurrentTier) {
uint coinsInCurrentTierToBuy = ((change) / (costOfACoinInWeiForTier[i]));
coins = ((coins) + (coinsInCurrentTierToBuy));
numberOfCoinsAvailableInIcoTier[i] = ((numberOfCoinsAvailableInIcoTier[i]) - (coinsInCurrentTierToBuy));
change = 0;
break;
}

coins = ((coins) + (numberOfCoinsAvailableInIcoTier[i]));
change = ((change) - (costOfAvailableCoinsInCurrentTier));
numberOfCoinsAvailableInIcoTier[i] = 0;
}


  }

  

}

//#LOOPVARS: i



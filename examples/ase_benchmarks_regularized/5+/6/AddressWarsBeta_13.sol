






contract C {
  

  

  uint256 totalWagers;
uint256[] allOwnersClaimPrice;
uint256 cheapestSale;
uint256 indexOfCheapestSale;

  function foo() public {
    
for(uint256 i = 0; i < allOwnersClaimPrice.length; i++){
uint256 priceAtIndex = allOwnersClaimPrice[i];
if (priceAtIndex != 0) {
totalWagers++;
if (cheapestSale == 0 || priceAtIndex < cheapestSale) {
cheapestSale = priceAtIndex;
indexOfCheapestSale = i;
}

}

}


  }

  

}

//#LOOPVARS: i



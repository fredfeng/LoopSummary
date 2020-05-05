






contract C {
  

  

  uint256 totalWagers;
uint256[] allOwnersClaimPrice;
uint256 saleRank;
uint256 cheapestSale;
uint256 i;

  function foo() public {
    
for(uint i = 0; i < allOwnersClaimPrice.length; i++){
if (allOwnersClaimPrice[i] != 0) {
totalWagers++;
if (allOwnersClaimPrice[i] < cheapestSale) {
saleRank++;
}

}

}


  }

  

}

//#LOOPVARS: i



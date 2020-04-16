
pragma solidity ^0.5.10;



contract C {
  

  uint256 saleRank;
uint256[] allOwnersClaimPrice;
uint256 i;
uint256 cheapestSale;
uint256 totalWagers;

  function foo() public {
    
for(i = 0; i < allOwnersClaimPrice.length; i++){
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

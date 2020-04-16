
pragma solidity ^0.5.10;



contract C {
  

  uint256[] indexes;
uint256[] allOwnersClaimPrice;
uint256 i;
uint256 cheapestSale;
uint256 indexOfCheapestSale;

  function foo() public {
    
for(uint256 i = 0; i < indexes.length; i++){
if (allOwnersClaimPrice[indexes[i]] != 0 && (cheapestSale == 0 || allOwnersClaimPrice[indexes[i]] < cheapestSale)) {
cheapestSale = allOwnersClaimPrice[indexes[i]];
indexOfCheapestSale = indexes[i];
}

}


  }
}

//#LOOPVARS: i

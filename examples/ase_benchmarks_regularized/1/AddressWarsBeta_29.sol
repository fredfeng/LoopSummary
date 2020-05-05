






contract C {
  

  

  bytes32[] allOwnersClaimPrice;
uint256[] ownersClaimPriceOfCardAddress;

  function foo() public {
    
for(uint256 i = 0; i < ownersClaimPriceOfCardAddress.length; i++){
allOwnersClaimPrice[i] = bytes32(ownersClaimPriceOfCardAddress[i]);
}


  }

  

}

//#LOOPVARS: i




pragma solidity ^0.5.10;



contract C {
  

  uint256[] ownersClaimPriceOfCardAddress;
uint256 i;
bytes32[] allOwnersClaimPrice;

  function foo() public {
    
for(uint256 i = 0; i < ownersClaimPriceOfCardAddress.length; i++){
allOwnersClaimPrice[i] = bytes32(ownersClaimPriceOfCardAddress[i]);
}


  }
}

//#LOOPVARS: i

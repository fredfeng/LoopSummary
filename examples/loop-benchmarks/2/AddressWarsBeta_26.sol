
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes32[] allCardsLowestPrice;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsLowestPrice[i] = bytes32(addressCard._lowestPrice);
}


  }
}

//#LOOPVARS: i

contract AddressCard { }

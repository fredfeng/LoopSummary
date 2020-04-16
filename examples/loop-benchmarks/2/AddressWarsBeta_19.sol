
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes1[] allCardsModifier;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsModifier[i] = bytes1(addressCard._cardModifier);
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

contract AddressCard { }

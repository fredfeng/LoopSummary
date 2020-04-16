
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes1[] allCardsModifierSecondaryVal;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsModifierSecondaryVal[i] = bytes1(addressCard._modifierSecondaryVal);
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

contract AddressCard { }

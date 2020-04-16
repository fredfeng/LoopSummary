
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
uint256 i;
bytes1[] allCardsModifierPrimaryVal;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsModifierPrimaryVal[i] = bytes1(addressCard._modifierPrimarayVal);
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

contract AddressCard { }

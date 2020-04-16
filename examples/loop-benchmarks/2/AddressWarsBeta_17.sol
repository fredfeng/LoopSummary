
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes20[] allCardsAddress;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsAddress[i] = bytes20(addressCard._cardAddress);
}


  }
}

//#LOOPVARS: i

contract bytes20 { }

contract AddressCard { }


pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes1[] allCardsAttack;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsAttack[i] = bytes1(addressCard._attack);
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

contract AddressCard { }


pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes1[] allCardsForClaim;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsForClaim[i] = bytes1(addressCard._forClaim);
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

contract AddressCard { }


pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
bytes1[] allCardsClaimed;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsClaimed[i] = bytes1(addressCard._claimed);
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

contract AddressCard { }

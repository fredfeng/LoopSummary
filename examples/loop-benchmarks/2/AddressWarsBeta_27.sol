
pragma solidity ^0.5.10;



contract C {
  

  AddressCard[] _addressCards;
mapping(address => uint256) _indexOf;
bytes4[] allCardsClaimContender;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _addressCards.length; i++){
AddressCard addressCard = _addressCards[i];
allCardsClaimContender[i] = bytes4(_indexOf[addressCard._claimContender]);
}


  }
}

//#LOOPVARS: i

contract AddressCard { }

contract bytes4 { }

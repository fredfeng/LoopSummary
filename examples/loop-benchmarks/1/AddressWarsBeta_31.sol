
pragma solidity ^0.5.10;



contract C {
  

  address owner;
address[] cardsOfOwner;
uint256 i;
bytes1[] allCardAddressesCount;

  function foo() public {
    
for(uint256 i = 0; i < cardsOfOwner.length; i++){
allCardAddressesCount[i] = bytes1(ownerCountOfCard(owner, cardsOfOwner[i]));
}


  }
}

//#LOOPVARS: i

contract bytes1 { }

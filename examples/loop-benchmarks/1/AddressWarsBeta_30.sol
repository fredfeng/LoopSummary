
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) _indexOf;
address[] cardsOfOwner;
bytes4[] allCardAddresses;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < cardsOfOwner.length; i++){
allCardAddresses[i] = bytes4(_indexOf[cardsOfOwner[i]]);
}


  }
}

//#LOOPVARS: i

contract bytes4 { }

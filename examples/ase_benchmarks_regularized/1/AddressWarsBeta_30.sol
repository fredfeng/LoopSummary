






contract C {
  

  

  bytes4[] allCardAddresses;
address[] cardsOfOwner;
mapping(address => uint256) _indexOf;

  function foo() public {
    
for(uint256 i = 0; i < cardsOfOwner.length; i++){
allCardAddresses[i] = bytes4(_indexOf[cardsOfOwner[i]]);
}


  }

  

}

//#LOOPVARS: i



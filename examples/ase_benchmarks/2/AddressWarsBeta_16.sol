






contract C {
  

  

  address cardAddress;
address[] cardsOfOwner;
uint256 matchedIndex;

  function foo() public {
    
for(uint256 i = 0; i < cardsOfOwner.length; i++){
if (cardsOfOwner[i] == cardAddress) {
matchedIndex = i;
break;
}

}


  }

  

}

//#LOOPVARS: i



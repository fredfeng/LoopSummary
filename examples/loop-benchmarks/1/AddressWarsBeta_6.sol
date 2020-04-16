
pragma solidity ^0.5.10;



contract C {
  

  uint256 cardIndexOfSender;
mapping(address => address[]) _cardsOf;
address fromAddress;
uint256 i;

  function foo() public {
    
for(uint256 i = cardIndexOfSender; i < _cardsOf[fromAddress].length - 1; i++){
_cardsOf[fromAddress][i] = _cardsOf[fromAddress][i + 1];
}


  }
}

//#LOOPVARS: i

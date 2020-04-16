
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _requestedCardCounts;
uint256 j;
address _buyer;
address _seller;
uint256[] _requestedCardIds;
CopaCore copaCore;

  function foo() public {
    
for(uint256 j = 0; j < _requestedCardIds.length; j++){
copaCore.transferFrom(_buyer, _seller, _requestedCardIds[j], _requestedCardCounts[j]);
}


  }
}

//#LOOPVARS: j

contract CopaCore { }

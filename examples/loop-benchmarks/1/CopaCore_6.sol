
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _offeredCardIds;
address _buyer;
uint256 i;
uint256[] _offeredCardCounts;
CopaCore copaCore;

  function foo() public {
    
for(uint256 i = 0; i < _offeredCardIds.length; i++){
copaCore.transfer(_buyer, _offeredCardIds[i], _offeredCardCounts[i]);
}


  }
}

//#LOOPVARS: i

contract CopaCore { }

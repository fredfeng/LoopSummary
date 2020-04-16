
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _offeredCardIds;
uint256 i;
uint256[] _offeredCardCounts;
address _seller;
CopaCore copaCore;

  function foo() public {
    
for(uint256 i = 0; i < _offeredCardIds.length; i++){
copaCore.transferFrom(_seller, address(this), _offeredCardIds[i], _offeredCardCounts[i]);
}


  }
}

//#LOOPVARS: i

contract CopaCore { }

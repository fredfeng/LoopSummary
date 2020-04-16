
pragma solidity ^0.5.10;



contract C {
  

  mapping(uint256 => uint256[]) ticketOptionValues_;
uint256 _totalCount;
uint256 _fullMatchResult;
uint256 _matchId;
uint i;

  function foo() public {
    
for(uint i = 0; i < ticketOptionValues_[_matchId].length; i++){
if (i <= 2) {
_fullMatchResult = (_fullMatchResult) + (ticketOptionValues_[_matchId][i]);
}

_totalCount = (_totalCount) + (ticketOptionValues_[_matchId][i]);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  uint256 betProfit;
QIU3Ddatasets.MatchPlayer _matchPlayer_;
QIU3Ddatasets.Match _match_;
uint i;

  function foo() public {
    
for(uint i = 0; i < _matchPlayer_.betIds.length; i++){
uint256 _betId = _matchPlayer_.betIds[i];
betProfit = betProfit.add(calculateBetProfit_(_match_, _betId));
}


  }
}

//#LOOPVARS: i

contract QIU3Ddatasets.Match { }

contract QIU3Ddatasets.MatchPlayer { }

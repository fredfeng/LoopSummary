
pragma solidity ^0.5.10;



contract C {
  

  uint256 _remainTicketJackpot;
uint256 _ticketId;
QIU3Ddatasets.MatchPlayer _matchPlayer_;
uint256 totalTicketDividend;
uint256 totalTicketProfit;
QIU3Ddatasets.TicketEventIntReturns _profitReturns_;
uint256 _matchId;
QIU3Ddatasets.Match _match_;
uint i;

  function foo() public {
    
for(uint i = 0; i < _matchPlayer_.ticketIds.length; i++){
uint256 tId = 0;
if (_ticketId != 0) {
tId = _ticketId;
} else {
tId = _matchPlayer_.ticketIds[i];
}

totalTicketProfit = totalTicketProfit.add(calculateTicketProfit_(_matchId, _profitReturns_, _match_.tickets[tId]));
totalTicketDividend = totalTicketDividend.add(calculateTicketDividend_(_matchId, _remainTicketJackpot, _match_.tickets[tId]));
if (_ticketId != 0) {
break;
}

}


  }
}

//#LOOPVARS: i

contract QIU3Ddatasets.TicketEventIntReturns { }

contract QIU3Ddatasets.Match { }

contract QIU3Ddatasets.MatchPlayer { }

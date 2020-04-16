
pragma solidity ^0.5.10;



contract C {
  

  QIU3Ddatasets.Player _player_;
uint256 totalBetProfit;
uint256 totalTicketDividend;
uint256 totalTicketProfit;
uint i;

  function foo() public {
    
for(uint i = 0; i < _player_.matchIds.length; i++){
uint256 ticketProfit = 0;
uint256 ticketDividend = 0;
uint256 betProfit = 0;
(ticketProfit, ticketDividend, betProfit) = getPlayerProfitInMatch(_player_.matchIds[i]);
totalTicketProfit = (totalTicketProfit) + (ticketProfit);
totalTicketDividend = (totalTicketDividend) + (ticketDividend);
totalBetProfit = (totalBetProfit) + (betProfit);
}


  }
}

//#LOOPVARS: i

contract QIU3Ddatasets.Player { }


pragma solidity ^0.5.10;



contract C {
  

  Player[] players;
uint256 _no1Spaceship;
uint i;
uint256 _eachMoney;

  function foo() public {
    
for(uint i = 0; i < players.length; i++){
Player _tmpP = players[i];
if (_no1Spaceship == 0) {
_tmpP.earnings = (_tmpP.earnings) + ((_tmpP.dlTicketCount) * (_eachMoney));
_tmpP.dividendEarnings = (_tmpP.dividendEarnings) + ((_tmpP.dlTicketCount) * (_eachMoney));
}

if (_no1Spaceship == 1) {
_tmpP.earnings = (_tmpP.earnings) + ((_tmpP.xzTicketCount) * (_eachMoney));
_tmpP.dividendEarnings = (_tmpP.dividendEarnings) + ((_tmpP.xzTicketCount) * (_eachMoney));
}

if (_no1Spaceship == 2) {
_tmpP.earnings = (_tmpP.earnings) + ((_tmpP.jcTicketCount) * (_eachMoney));
_tmpP.dividendEarnings = (_tmpP.dividendEarnings) + ((_tmpP.jcTicketCount) * (_eachMoney));
}

_tmpP.dlTicketCount = 0;
_tmpP.xzTicketCount = 0;
_tmpP.jcTicketCount = 0;
_tmpP.ticketCount = 0;
}


  }
}

//#LOOPVARS: i

contract Player { }

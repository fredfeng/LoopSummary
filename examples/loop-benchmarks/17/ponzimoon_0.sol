
pragma solidity ^0.5.10;



contract C {
  

  Player[] players;
uint256 arrayPid;
uint256 _ticketCount;
uint256 _jcFMoney;
uint256 _dlFMoney;
uint256 _spaceshipNo;
uint i;
uint256 _xzFMoney;

  function foo() public {
    
for(uint i = 0; i < players.length; i++){
Player _tmpP = players[i];
uint256 _totalMoney = 0;
if (arrayPid != i) {
_totalMoney = (_totalMoney) + ((_tmpP.dlTicketCount) * (_dlFMoney));
_totalMoney = (_totalMoney) + ((_tmpP.xzTicketCount) * (_xzFMoney));
_totalMoney = (_totalMoney) + ((_tmpP.jcTicketCount) * (_jcFMoney));
} else {
if (_spaceshipNo == 0) {
_totalMoney = (_totalMoney) + ((((_tmpP.dlTicketCount) - (_ticketCount))) * (_dlFMoney));
} else {
_totalMoney = (_totalMoney) + ((_tmpP.dlTicketCount) * (_dlFMoney));
}

if (_spaceshipNo == 1) {
_totalMoney = (_totalMoney) + ((((_tmpP.xzTicketCount) - (_ticketCount))) * (_xzFMoney));
} else {
_totalMoney = (_totalMoney) + ((_tmpP.xzTicketCount) * (_xzFMoney));
}

if (_spaceshipNo == 2) {
_totalMoney = (_totalMoney) + ((((_tmpP.jcTicketCount) - (_ticketCount))) * (_jcFMoney));
} else {
_totalMoney = (_totalMoney) + ((_tmpP.jcTicketCount) * (_jcFMoney));
}

}

_tmpP.earnings = (_tmpP.earnings) + (_totalMoney);
_tmpP.dividendEarnings = (_tmpP.dividendEarnings) + (_totalMoney);
}


  }
}

//#LOOPVARS: i

contract Player { }

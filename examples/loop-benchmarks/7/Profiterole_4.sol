
pragma solidity ^0.5.10;



contract C {
  

  LockedDeposits _lockedDeposits;
uint _lockedDepositsCounter;
uint _lockedSum;
uint _idx;

  function foo() public {
    
for(uint _idx = 1; _idx <= _lockedDepositsCounter; ++_idx){
uint _lockDate = _lockedDeposits.index2Date[_idx];
if (_lockDate <= now) {
_lockedDeposits.index2Date[_idx] = _lockedDeposits.index2Date[_lockedDepositsCounter];
delete _lockedDeposits.index2Date[_lockedDepositsCounter];
delete _lockedDeposits.date2deposit[_lockDate];
_lockedDepositsCounter = (_lockedDepositsCounter) - (1);
continue;
}

_lockedSum = (_lockedSum) + (_lockedDeposits.date2deposit[_lockDate]);
}


  }
}

//#LOOPVARS: _idx

contract LockedDeposits { }


pragma solidity ^0.5.10;



contract C {
  

  uint _pointer;
LockedDeposits _lockedDeposits;
uint _lockedDepositsCounter;
uint[] _deposits;
uint _idx;
uint[] _lockupDates;

  function foo() public {
    
for(uint _idx = 1; _idx < _lockedDepositsCounter; ++_idx){
uint _lockDate = _lockedDeposits.index2Date[_idx];
if (_lockDate > now) {
_lockupDates[_pointer] = _lockDate;
_deposits[_pointer] = _lockedDeposits.date2deposit[_lockDate];
++_pointer;
}

}


  }
}

//#LOOPVARS: _idx

contract LockedDeposits { }

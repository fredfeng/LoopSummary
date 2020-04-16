
pragma solidity ^0.5.10;



contract C {
  

  address[] _receivers;
uint256 i;
ERC777TokenScheduledTimelock timelock;
uint256 lockTill;
uint256[] _lockPeroids;
uint256 timestamp;
uint256[] _amounts;
address receiver;

  function foo() public {
    
for(i = 0; i < _receivers.length; i++){
receiver = _receivers[i];
require(receiver != address(0));
lockTill = _lockPeroids[i];
require(lockTill > timestamp);
timelock.scheduleTimelock(receiver, _amounts[i], lockTill);
}


  }
}

//#LOOPVARS: i

contract ERC777TokenScheduledTimelock { }

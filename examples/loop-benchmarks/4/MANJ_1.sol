
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
uint256 _cannotReceiveUntil;
uint256 _cannotSendUntil;
uint256 cannotSendUntil;
uint i;
uint256 cannotReceiveUntil;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
require(cannotSendUntil[targets[i]] <= _cannotSendUntil && cannotReceiveUntil[targets[i]] <= _cannotReceiveUntil);
cannotSendUntil[targets[i]] = _cannotSendUntil;
cannotReceiveUntil[targets[i]] = _cannotReceiveUntil;
emit LockedFunds(targets[i], _cannotSendUntil, _cannotReceiveUntil);
}


  }
}

//#LOOPVARS: i








contract C {
  

  

  uint256 _cannotReceiveUntil;
uint256 _cannotSendUntil;
uint256 cannotReceiveUntil;
address[] targets;
uint256 cannotSendUntil;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
require(cannotSendUntil[targets[i]] <= _cannotSendUntil && cannotReceiveUntil[targets[i]] <= _cannotReceiveUntil);
cannotSendUntil[targets[i]] = _cannotSendUntil;
cannotReceiveUntil[targets[i]] = _cannotReceiveUntil;

}


  }

  

}

//#LOOPVARS: i



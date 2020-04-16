
pragma solidity ^0.5.10;



contract C {
  

  address[] targets;
bool cannotSend;
bool _cannotSend;
bool cannotReceive;
bool _cannotReceive;
uint i;

  function foo() public {
    
for(uint i = 0; i < targets.length; i++){
cannotSend[targets[i]] = _cannotSend;
cannotReceive[targets[i]] = _cannotReceive;
emit FrozenFunds(targets[i], _cannotSend, _cannotReceive);
}


  }
}

//#LOOPVARS: i

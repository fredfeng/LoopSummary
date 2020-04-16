
pragma solidity ^0.5.10;



contract C {
  

  address[] _participants;
uint i;
mapping(address => bool) locked;

  function foo() public {
    
for(uint i = 0; i < _participants.length; i++){
locked[_participants[i]] = false;
LockRemoved(_participants[i]);
}


  }
}

//#LOOPVARS: i

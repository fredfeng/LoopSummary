
pragma solidity ^0.5.10;



contract C {
  

  uint256 _cap;
address[] _participants;
uint i;
mapping(address => uint256) participationCaps;

  function foo() public {
    
for(uint i = 0; i < _participants.length; i++){
participationCaps[_participants[i]] = _cap;
}


  }
}

//#LOOPVARS: i

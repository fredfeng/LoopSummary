






contract C {
  

  

  mapping(address => uint256) participationCaps;
address[] _participants;
uint256 _cap;

  function foo() public {
    
for(uint i = 0; i < _participants.length; i++){
participationCaps[_participants[i]] = _cap;
}


  }

  

}

//#LOOPVARS: i



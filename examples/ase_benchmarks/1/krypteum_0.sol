






contract C {
  

  

  address[] _participants;
mapping(address => bool) locked;

  function foo() public {
    
for(uint i = 0; i < _participants.length; i++){
locked[_participants[i]] = false;

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  address[] _investors;
mapping(address => bool) isWhitelisted;
address investor;

  function foo() public {
    
for(uint256 c; c < _investors.length; c = ((c) + (1))){
investor = _investors[c];
isWhitelisted[investor] = true;

}


  }

  

}

//#LOOPVARS: c



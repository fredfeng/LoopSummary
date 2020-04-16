
pragma solidity ^0.5.10;



contract C {
  

  address[] _investors;
address investor;
mapping(address => bool) isWhitelisted;
uint256 c;

  function foo() public {
    
for(uint256 c; c < _investors.length; c = (c) + (1)){
investor = _investors[c];
isWhitelisted[investor] = true;
ChangedInvestorWhitelisting(investor, true);
}


  }
}

//#LOOPVARS: c

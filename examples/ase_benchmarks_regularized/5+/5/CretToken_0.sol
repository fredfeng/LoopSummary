






contract C {
  

  

  uint256 lastBountyStatus;
address[] _dests;
uint256 totalSupply;
uint256 bountyTokens;
uint256 _value;
mapping(address => uint256) balances;

  function foo() public {
    
for(uint256 i = 0; i < _dests.length; i++){
address tmp = _dests[i];
balances[tmp] = ((balances[tmp]) + (_value));
totalSupply = ((totalSupply) + (_value));
bountyTokens = ((bountyTokens) + (_value));
lastBountyStatus++;

}


  }

  

}

//#LOOPVARS: i



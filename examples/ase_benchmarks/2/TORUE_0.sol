






contract C {
  

  

  mapping(address => uint256) lockedAccounts;
address[] _addresses;
uint256 _releaseTime;

  function foo() public {
    
for(uint j = 0; j < _addresses.length; j++){
require(lockedAccounts[_addresses[j]] < _releaseTime);
lockedAccounts[_addresses[j]] = _releaseTime;

}


  }

  

}

//#LOOPVARS: j



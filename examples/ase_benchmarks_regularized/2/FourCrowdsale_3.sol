






contract C {
  

  

  uint256 whitelistedCount;
mapping(address => bool) whitelisted;
address[] _addrs;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
whitelisted[_addrs[i]] = true;
whitelistedCount++;
}


  }

  

}

//#LOOPVARS: i



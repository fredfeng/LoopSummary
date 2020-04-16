
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => bool) whitelisted;
uint256 whitelistedCount;
uint256 i;
address[] _addrs;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
whitelisted[_addrs[i]] = true;
whitelistedCount++;
}


  }
}

//#LOOPVARS: i

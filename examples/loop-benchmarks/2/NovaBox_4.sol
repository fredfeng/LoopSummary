
pragma solidity ^0.5.10;



contract C {
  

  uint[] _contributions;
address[] _addrs;
uint256 lastIndex;
mapping(uint => address) addresses;
mapping(address => uint) contributionsToken;
uint i;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
_addrs[i - 1] = addresses[i];
_contributions[i - 1] = contributionsToken[addresses[i]];
}


  }
}

//#LOOPVARS: i

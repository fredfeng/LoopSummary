
pragma solidity ^0.5.10;



contract C {
  

  uint256 lastIndex;
mapping(uint => address) addresses;
uint result;
mapping(address => uint) contributionsToken;
uint i;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
result = (result) + (contributionsToken[addresses[i]]);
}


  }
}

//#LOOPVARS: i

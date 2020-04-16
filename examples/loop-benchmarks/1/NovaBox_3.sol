
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint) contributionsEth;
uint256 lastIndex;
mapping(uint => address) addresses;
uint result;
uint i;

  function foo() public {
    
for(uint i = 1; i <= lastIndex; i++){
result = (result) + (contributionsEth[addresses[i]]);
}


  }
}

//#LOOPVARS: i

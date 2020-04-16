
pragma solidity ^0.5.10;



contract C {
  

  mapping(address => uint256) shares;
mapping(uint256 => address) members;
uint i;
uint256 total;

  function foo() public {
    
for(uint i = 0; i < total; i++){
uint256 totalshares;
totalshares += shares[members[i]];
}


  }
}

//#LOOPVARS: i

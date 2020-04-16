
pragma solidity ^0.5.10;



contract C {
  

  address[] tokenAddresses;
TokenInfo[] tokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokens.length; i++){
tokenAddresses[i] = tokens[i].addr;
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }

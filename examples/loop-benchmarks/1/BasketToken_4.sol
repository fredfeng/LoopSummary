
pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
TokenInfo[] tokens;
address[] tokenAddresses;

  function foo() public {
    
for(uint8 i = 0; i < tokens.length; i++){
tokenAddresses[i] = tokens[i].addr;
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }

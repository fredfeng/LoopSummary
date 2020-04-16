
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
TokenInfo[] tokens;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < tokens.length; i++){
addresses[i] = tokens[i].addr;
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }


pragma solidity ^0.5.10;



contract C {
  

  uint8 i;
uint256[] tokenUnits;
TokenInfo[] tokens;

  function foo() public {
    
for(uint8 i = 0; i < tokens.length; i++){
tokenUnits[i] = tokens[i].tokenUnits;
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }

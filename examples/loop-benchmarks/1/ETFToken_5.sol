
pragma solidity ^0.5.10;



contract C {
  

  uint256[] tokenUnits;
TokenInfo[] tokens;
uint i;

  function foo() public {
    
for(uint i = 0; i < tokens.length; i++){
tokenUnits[i] = tokens[i].tokenUnits;
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }

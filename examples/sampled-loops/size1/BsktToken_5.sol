
pragma solidity ^0.5.10;



contract C {
  

  TokenInfo[] tokens;
uint256[] quantities;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < tokens.length; i++){
quantities[i] = tokens[i].quantity;
}


  }
}

//#LOOPVARS: i

contract TokenInfo { }


pragma solidity ^0.5.10;



contract C {
  

  address[] _addresses;
uint256[] _tokens;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < _tokens.length; i = (i) + (1)){
generateTokens(_addresses[i], _tokens[i]);
}


  }
}

//#LOOPVARS: i

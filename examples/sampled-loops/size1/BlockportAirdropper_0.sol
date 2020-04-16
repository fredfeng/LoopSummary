
pragma solidity ^0.5.10;



contract C {
  

  ERC20Basic token;
uint multiplier;
uint256 i;
address[] dests;
uint[] values;

  function foo() public {
    
for(uint256 i = 0; i < dests.length; i++){
token.transfer(dests[i], (values[i]) * (multiplier));
}


  }
}

//#LOOPVARS: i

contract ERC20Basic { }

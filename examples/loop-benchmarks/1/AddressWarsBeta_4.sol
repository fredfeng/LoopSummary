
pragma solidity ^0.5.10;



contract C {
  

  address owner;
address[] choices;
uint256 i;

  function foo() public {
    
for(uint256 i = 0; i < choices.length; i++){
require(ownerHasCardSimple(owner, choices[i]));
}


  }
}

//#LOOPVARS: i

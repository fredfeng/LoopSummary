
pragma solidity ^0.5.10;



contract C {
  

  GlobalConstraint[] globalConstraintsPre;
bytes32 func;
uint idx;

  function foo() public {
    
for(idx = 0; idx < globalConstraintsPre.length; idx++){
require((GlobalConstraintInterface(globalConstraintsPre[idx].gcAddress)).pre(msg.sender, globalConstraintsPre[idx].params, func));
}


  }
}

//#LOOPVARS: idx

contract GlobalConstraint { }

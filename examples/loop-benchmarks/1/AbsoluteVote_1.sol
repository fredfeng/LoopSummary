
pragma solidity ^0.5.10;



contract C {
  

  GlobalConstraint[] globalConstraintsPost;
bytes32 func;
uint idx;

  function foo() public {
    
for(idx = 0; idx < globalConstraintsPost.length; idx++){
require((GlobalConstraintInterface(globalConstraintsPost[idx].gcAddress)).post(msg.sender, globalConstraintsPost[idx].params, func));
}


  }
}

//#LOOPVARS: idx

contract GlobalConstraint { }

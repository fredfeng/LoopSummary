
pragma solidity ^0.5.10;



contract C {
  

  address[] users;
uint i;
uint256 indexToRemove;

  function foo() public {
    
for(uint i = indexToRemove; i < users.length - 1; i++){
users[i] = users[i + 1];
}


  }
}

//#LOOPVARS: i

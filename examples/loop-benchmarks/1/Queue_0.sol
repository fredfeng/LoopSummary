
pragma solidity ^0.5.10;



contract C {
  

  uint256 index;
address[] users;
address a;

  function foo() public {
    
for(index = 0; index < users.length; index++){
if (a == users[index]) {
return index;
}

}


  }
}

//#LOOPVARS: index

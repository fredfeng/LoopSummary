






contract C {
  

  

  uint256 indexToRemove;
address[] users;

  function foo() public {
    
for(uint i = indexToRemove; i < users.length - 1; i++){
users[i] = users[i + 1];
}


  }

  

}

//#LOOPVARS: i



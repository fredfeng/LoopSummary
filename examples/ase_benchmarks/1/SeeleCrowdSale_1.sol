






contract C {
  

  

  mapping(address => bool) fullWhiteList;
address[] users;
bool openTag;

  function foo() public {
    
for(uint i = 0; i < users.length; i++){
fullWhiteList[users[i]] = openTag;
}


  }

  

}

//#LOOPVARS: i



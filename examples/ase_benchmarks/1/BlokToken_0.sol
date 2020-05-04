






contract C {
  

  

  address[] tokenGrantees;
address _grantee;

  function foo() public {
    
for(uint i = 0; i < tokenGrantees.length; i++){
require(tokenGrantees[i] != _grantee);
}


  }

  

}

//#LOOPVARS: i



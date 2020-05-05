






contract C {
  

  

  address[] tokenGrantees;
address _grantee;

  function foo() public {
    
for(uint i = 0; i < tokenGrantees.length; i++){
if (tokenGrantees[i] == _grantee) {
delete tokenGrantees[i];
break;
}

}


  }

  

}

//#LOOPVARS: i



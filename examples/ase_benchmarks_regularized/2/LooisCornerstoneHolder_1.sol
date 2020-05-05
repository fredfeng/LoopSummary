






contract C {
  

  

  address[] managers;
address manager;

  function foo() public {
    
for(uint i = 0; i < managers.length; i++){
if (managers[i] == manager) {
managers[i] = managers[managers.length - 1];
break;
}

}


  }

  

}

//#LOOPVARS: i



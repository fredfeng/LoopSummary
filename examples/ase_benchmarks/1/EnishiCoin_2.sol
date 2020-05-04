






contract C {
  

  

  uint index;
address[] owners;

  function foo() public {
    
for(uint j = index; j < owners.length - 1; j++){
owners[j] = owners[j + 1];
}


  }

  

}

//#LOOPVARS: j



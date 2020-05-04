






contract C {
  

  

  address owner;
address[] owners;

  function foo() public {
    
for(uint i = 0; i < owners.length - 1; i++){
if (owners[i] == owner) {
owners[i] = owners[owners.length - 1];
break;
}

}


  }

  

}

//#LOOPVARS: i










contract C {
  

  

  mapping(address => bool) operational;
address[] addresses;
bool op;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
operational[addresses[i]] = op;
}


  }

  

}

//#LOOPVARS: i



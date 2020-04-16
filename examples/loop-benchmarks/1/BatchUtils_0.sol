
pragma solidity ^0.5.10;



contract C {
  

  address[] addresses;
bool op;
mapping(address => bool) operational;
uint i;

  function foo() public {
    
for(uint i = 0; i < addresses.length; i++){
operational[addresses[i]] = op;
}


  }
}

//#LOOPVARS: i

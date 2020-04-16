
pragma solidity ^0.5.10;



contract C {
  

  uint tokens_to_transfer;
address[] _addresses;
uint i;
uint[] _amounts;

  function foo() public {
    
for(i = 0; i < _addresses.length; i++){
tokens_to_transfer = (tokens_to_transfer) + (_amounts[i]);
}


  }
}

//#LOOPVARS: i

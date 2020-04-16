
pragma solidity ^0.5.10;



contract C {
  

  uint count;
address[] _confirmations;
uint i;
address[] confirmationsTemp;

  function foo() public {
    
for(i = 0; i < count; i++){
_confirmations[i] = confirmationsTemp[i];
}


  }
}

//#LOOPVARS: i

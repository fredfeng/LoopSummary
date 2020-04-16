
pragma solidity ^0.5.10;



contract C {
  

  uint[] _amounts;
address[] _addresses;
uint i;

  function foo() public {
    
for(i = 0; i < _addresses.length; i++){
super.transfer(_addresses[i], _amounts[i]);
}


  }
}

//#LOOPVARS: i

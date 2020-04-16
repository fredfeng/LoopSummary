
pragma solidity ^0.5.10;



contract C {
  

  uint[] _values;
uint total;
uint i;

  function foo() public {
    
for(uint i = 0; i < _values.length; i++){
total = (total) + (_values[i]);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  address[] _tos;
uint i;
uint256 total;
uint256[] _values;

  function foo() public {
    
for(uint i; i < _tos.length; i++){
total = (total) + (_values[i]);
require(_tos[i] != address(0));
}


  }
}

//#LOOPVARS: i

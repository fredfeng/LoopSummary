
pragma solidity ^0.5.10;



contract C {
  

  bool res;
uint i;
uint256[] _values;

  function foo() public {
    
for(uint i = 0; i < _values.length; i = (i) + (1)){
res = mintUnderCap(i, _values[i]) && res;
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  uint256[] _values;
uint256 i;
address[] _addrs;

  function foo() public {
    
for(uint256 i = 0; i < _addrs.length; i++){
_addrs[i].transfer(_values[i]);
}


  }
}

//#LOOPVARS: i

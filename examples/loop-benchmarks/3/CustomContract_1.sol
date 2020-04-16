
pragma solidity ^0.5.10;



contract C {
  

  uint256 sum;
uint i;
uint256[] _values;
address[] _addrs;

  function foo() public {
    
for(uint i = 0; i < _values.length; i++){
if (_values[i] == 0 || _addrs[i] == address(0)) {
revert();
}

sum = (sum) + (_values[i]);
}


  }
}

//#LOOPVARS: i

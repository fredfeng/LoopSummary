
pragma solidity ^0.5.10;



contract C {
  

  uint256[] _arr;
uint32[] ret;
uint256 _end;
uint256 i;
uint256 _start;

  function foo() public {
    
for(uint256 i = _start; i < _end; i++){
ret[i - _start] = uint32(_arr[i]);
}


  }
}

//#LOOPVARS: i


pragma solidity ^0.5.10;



contract C {
  

  uint256[] _arr;
uint256 _end;
uint256 i;
uint256 _start;
uint256[] ret;

  function foo() public {
    
for(uint256 i = _start; i < _end; i++){
ret[i - _start] = _arr[i];
}


  }
}

//#LOOPVARS: i
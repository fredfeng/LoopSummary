






contract C {
  

  

  uint256[] _arr;
uint256 _end;
uint256 _start;
uint32[] ret;

  function foo() public {
    
for(uint256 i = _start; i < _end; i++){
ret[i - _start] = uint32(_arr[i]);
}


  }

  

}

//#LOOPVARS: i



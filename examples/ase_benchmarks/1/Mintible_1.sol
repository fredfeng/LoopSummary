






contract C {
  

  

  uint256[] ret;
uint256[] _arr;
uint256 _end;
uint256 _start;

  function foo() public {
    
for(uint256 i = _start; i < _end; i++){
ret[i - _start] = _arr[i];
}


  }

  

}

//#LOOPVARS: i



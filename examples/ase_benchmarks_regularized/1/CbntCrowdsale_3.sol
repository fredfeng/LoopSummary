






contract C {
  

  

  uint32[] _times;

  function foo() public {
    
for(uint256 i = 0; i + 1 < _times.length; i++){
require(_times[i] < _times[i + 1]);
}


  }

  

}

//#LOOPVARS: i



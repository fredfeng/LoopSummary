






contract C {
  

  

  uint[] _releaseTimes;
uint[] _releaseRatios;
uint i;
uint len;

  function foo() public {
    
for(i = 0; i < len - 1; i++){
require(_releaseTimes[i] < _releaseTimes[i + 1]);
require(_releaseRatios[i] < _releaseRatios[i + 1]);
}


  }

  

}

//#LOOPVARS: i



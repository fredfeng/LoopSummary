






contract C {
  

  

  uint32[] times;

  function foo() public {
    
for(uint i = 0; i + 1 < times.length; i++){
require(times[i] < times[i + 1]);
}


  }

  

}

//#LOOPVARS: i



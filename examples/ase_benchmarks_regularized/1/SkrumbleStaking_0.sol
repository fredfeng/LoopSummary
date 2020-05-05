






contract C {
  

  

  uint[] _period;

  function foo() public {
    
for(uint i = 1; i < _period.length; i++){
require(_period[i] > _period[((i) - (1))]);
}


  }

  

}

//#LOOPVARS: i


